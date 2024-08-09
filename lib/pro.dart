import 'package:flutter/material.dart';
import 'package:task/model.dart';
import 'package:task/service.dart';

class NotesPro with ChangeNotifier {
  final NoteService service = NoteService();
  List<NoteModel> notelist = [];

  Future<void> fetchNotes() async {
    try {
      notelist = await service.fetchNotes();
      notifyListeners();
    } catch (e) {
      print('$e');
    }
  }

  Future<void> addNote(NoteModel note) async {
    try {
      await service.addNote(note);
      await fetchNotes();
    } catch (e) {
      print('$e');
    }
  }
}
