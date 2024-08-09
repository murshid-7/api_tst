import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/add.dart';
import 'package:task/pro.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes')),
      body: Consumer<NotesPro>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.notelist.length,
            itemBuilder: (context, index) {
              final note = provider.notelist[index];
              return ListTile(
                title: Text(note.name ?? ''),
                subtitle: Text(note.description ?? 'No Description'),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
