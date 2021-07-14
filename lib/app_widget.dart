import 'package:flutter/material.dart';
import 'package:notes/create_note_page.dart';
import 'package:notes/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      title: 'Notes',
      initialRoute: '/home',
      routes: {
        '/home': (conntext) => HomePage(),
        '/create-note': (context) => CreateNotePage()
      },
    );
  }
}
