import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  String title;
  bool isEditing;

  AppBarWidget(String title, bool isEditing)
      : this.title = title,
        this.isEditing = isEditing;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(this.title),
      actions: [
        if (isEditing)
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                Navigator.pop(context, '');
              })
      ],
    );
  }
}
