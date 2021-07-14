import 'package:flutter/material.dart';
import 'package:notes/app_bar_widget.dart';
import 'package:notes/create_note_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notes = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarWidget("Notes", false),
          preferredSize: Size.fromHeight(50)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var i = 0; i < notes.length; i++)
              Card(
                child: ListTile(
                    title: Text(notes[i]),
                    onTap: () async {
                      final response = await Navigator.pushNamed(
                          context, '/create-note',
                          arguments: notes[i]);

                      if (response != null) {
                        var description = response as String;
                        if (response.isEmpty) {
                          notes.removeAt(i);
                        } else {
                          notes[i] = description;
                        }
                        setState(() {});
                      }
                    }),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final description =
              await Navigator.pushNamed(context, '/create-note');
          if (description != null) {
            notes.add(description as String);
            setState(() {});
          }
        },
      ),
    );
  }
}
