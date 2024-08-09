import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task/model.dart';

class NoteService {
  final String url =
      'https://66b5e248b5ae2d11eb6518fb.mockapi.io/api/notes/notes';

  Future<List<NoteModel>> fetchNotes() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => NoteModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load ');
      }
    } catch (error) {
      throw Exception('$error');
    }
  }

  Future<void> addNote(NoteModel note) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(note.toJson()),
      );
      if (response.statusCode != 201) {
        throw Exception('Failed to add');
      }
    } catch (error) {
      throw Exception('$error');
    }
  }
}
