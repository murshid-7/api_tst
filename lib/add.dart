import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/model.dart';
import 'package:task/pro.dart';

class AddScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<NotesPro>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text('Add Note')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text;
                final description = descriptionController.text;

                final note = NoteModel(
                  name: name,
                  description: description,
                );
                pro.addNote(note);
                Navigator.of(context).pop();
              },
              child: const Text('Add Note'),
            ),
          ],
        ),
      ),
    );
  }
}
