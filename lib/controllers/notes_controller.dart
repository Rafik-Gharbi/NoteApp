import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../constants/shared_preferences_keys.dart';
import '../models/note.dart';
import '../services/shared_preferences_service.dart';

class NotesController extends GetxController {
  List<Note> userNotes = [];
  RxBool isShrinked = false.obs;
  RxString focusedNode = ''.obs;

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
}
