import 'package:flutter/material.dart';
import 'package:todoapp/until/custom_buton.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  const DialogBox({super.key, required this.controller, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: 'Add new task', border: OutlineInputBorder()),
            ),
            //Actions button
            Row(
              children: [
                //cancel button
                CustomButon(
                  text: 'Cancel',
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                //save button
                CustomButon(
                  text: 'Save',
                  onPressed: onSave,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
