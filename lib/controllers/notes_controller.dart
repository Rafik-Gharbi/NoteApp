import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../constants/shared_preferences_keys.dart';
import '../models/note.dart';
import '../services/shared_preferences_service.dart';
import '../views/edit_screen.dart';

class NotesController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  List<Note> userNotes = [];
  RxBool isShrinked = false.obs;
  RxString focusedNode = ''.obs;
  bool isEditMode = false;

  static final NotesController _singleton = NotesController._internal();

  factory NotesController() => _singleton;

  NotesController._internal() {
    getData();
  }

  Future<void> getData() async {
    final currentUser = await SharedPreferencesService().read(userKey);
    final response = await FirebaseFirestore.instance.collection('notes').where('user', isEqualTo: currentUser).get();
    if (response.docs.isNotEmpty) {
      userNotes = response.docs.map((e) => Note.fromJson(e.data(), e.id)).toList();
      debugPrint(userNotes.length.toString());
    }
    update();
  }

  Future<void> deleteNote(id) async {
    FirebaseFirestore.instance.collection('notes').where(FieldPath.documentId, isEqualTo: id).get().then((value) async {
      if (value.docs.isNotEmpty) {
        await value.docs.first.reference.delete();
        getData();
      }
    });
  }

  void openEditNote({required Note note, bool viewMode = true}) {
    isEditMode = !viewMode;
    titleController.text = note.title ?? '';
    descriptionController.text = note.content ?? '';
    Get.toNamed(EditScreen.routeName, arguments: note)?.then((_) => clearFormFields());
  }

  void clearFormFields() {
    isEditMode = false;
    titleController.text = '';
    descriptionController.text = '';
  }

  Future<void> upsertNote(Note? note) async {
    if (titleController.text.isNotEmpty && descriptionController.text.isNotEmpty) {
      if (note != null) {
        // Edit note
        await FirebaseFirestore.instance.collection('notes').doc(note.id).update({
          'title': titleController.text,
          'description': descriptionController.text,
        });
      } else {
        // Add new note
        final note = Note(title: titleController.text, content: descriptionController.text);
        final currentUser = await SharedPreferencesService().read(userKey);
        if (currentUser != null) {
          await FirebaseFirestore.instance.collection('notes').add(note.toJson(currentUser));
        }
      }
      Get.back();
      getData();
    }
  }
}
