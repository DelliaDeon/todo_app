import 'package:flutter/material.dart';
import 'package:simple_todo_app/utils/custom_button.dart';

class CreatingItem extends StatelessWidget {
  final controller;
  VoidCallback save;
  VoidCallback cancel;

  CreatingItem({
    super.key,
    required this.controller,
    required this.save,
    required this.cancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.pink.shade100,
      title: Column(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Enter a new task',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              )
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(text: 'Save', onPressed: save),

              CustomButton(text: 'Cancel', onPressed: cancel)
            ],
          ),
        ],
      ),
    );
  }
}
