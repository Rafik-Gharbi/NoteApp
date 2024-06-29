import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/notes_controller.dart';
import '../models/note.dart';

class EditScreen extends StatelessWidget {
  static const String routeName = '/edit-note';
  final Note? note;
  const EditScreen({Key? key, this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotesController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          leading: const SizedBox(),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
          title: const Text('App Bar Title', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          actions: [
            IconButton(
              style: const ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.white)),
              icon: const Icon(Icons.check_circle, size: 30),
              onPressed: () {},
            ),
            IconButton(
              style: const ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.white)),
              icon: const Icon(Icons.cancel_sharp, size: 30),
              onPressed: Get.back,
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              TextFormField(
                controller: controller.titleController,
                enabled: true,
                decoration: const InputDecoration(hintText: 'Type the title here'),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: TextFormField(
                  controller: controller.descriptionController,
                  enabled: true,
                  maxLines: null,
                  expands: true,
                  decoration: const InputDecoration(hintText: 'Type the description'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
