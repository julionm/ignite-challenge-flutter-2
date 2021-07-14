import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/app_bar_widget.dart';

class CreateNotePage extends StatefulWidget {
  @override
  _CreateNotePageState createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  String description = "";
  var textController = TextEditingController();
  var isEditing = false;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (ModalRoute.of(context)!.settings.arguments != null) {
        description = ModalRoute.of(context)!.settings.arguments as String;
        textController.text = description;
        isEditing = true;
        setState(() {});
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: AppBarWidget(
                isEditing ? "Edit Note" : "Create Note", isEditing),
            preferredSize: Size.fromHeight(50)),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: textController,
                maxLines: null,
                onChanged: (value) {
                  description = value;
                  setState(() {});
                },
                decoration: InputDecoration(labelText: "Descrição"),
              ),
              SizedBox(
                height: 32,
              ),
              if (description.isNotEmpty)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 250,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context, description);
                          },
                          child: Text("Salvar")),
                    ),
                  ],
                )
            ],
          ),
        ));
  }
}
