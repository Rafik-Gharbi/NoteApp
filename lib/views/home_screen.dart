import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/notes_controller.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotesController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('My Notes'),
            actions: [
              CircleAvatar(
                backgroundColor: Colors.blue.shade200,
                child: Text(
                  controller.userNotes.length.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          body: ListView.separated(
            itemCount: controller.userNotes.length,
            separatorBuilder: (context, index) => const Divider(color: Colors.blueGrey),
            itemBuilder: (context, index) {
              final note = controller.userNotes[index];
              return ListTile(
                trailing: SizedBox(
                  width: 110.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.blue),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                title: Text(note.title ?? ''),
                subtitle: Text(note.content ?? ''),
                onTap: () {},
                onLongPress: () {},
              );
            },
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: 'less/more',
                child: const Icon(Icons.menu),
                tooltip: 'Show less. Hide notes content',
                onPressed: () {},
              ),
              FloatingActionButton(
                heroTag: 'new-note',
                child: const Icon(Icons.add),
                tooltip: 'Add a new note',
                onPressed: () {},
              ),
            ],
          ),
        );
      }
    );
  }
}
