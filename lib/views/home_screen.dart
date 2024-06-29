import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/notes_controller.dart';
import '../widgets/build_floating_button.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotesController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightBlue,
            title: const Text('My Notes', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            actions: [
              CircleAvatar(
                backgroundColor: Colors.blue.shade100,
                child: Text(
                  controller.userNotes.length.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0, color: Colors.blue.shade600),
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
              return Obx(
                () => ListTile(
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
                  subtitle: controller.isShrinked.value ? null : Text(note.content ?? ''),
                  onTap: () {},
                  onLongPress: () {},
                ),
              );
            },
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Obx(
                () => BuildFloatingButton(
                  tag: 'less/more',
                  icon: controller.isShrinked.value ? Icons.menu : Icons.unfold_less_outlined,
                  onPressed: () => controller.isShrinked.value = !controller.isShrinked.value,
                  tooltip: 'Show less. Hide notes content',
                ),
              ),
              BuildFloatingButton(
                tag: 'new-note',
                icon: Icons.add,
                onPressed: () {},
                tooltip: 'Add a new note',
              ),
            ],
          ),
        );
      },
    );
  }
}
