import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/home.dart';
import 'package:task/pro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotesPro(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
