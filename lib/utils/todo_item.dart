import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoItem extends StatelessWidget {
  final String text;
  final bool value;
  void Function(bool?)? onChanged;
  void Function(BuildContext)? deleteTask;

  TodoItem({
    super.key,
    required this.text,
    required this.value,
    required this.onChanged,
    required this.deleteTask
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 20, right: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              borderRadius: BorderRadius.circular(20),
              icon: Icons.delete_forever,
              backgroundColor: Colors.red.shade800,
            ),
          ],
        ),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.pink.shade500,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              Checkbox(
                value: value,
                onChanged: onChanged,
              ),

              Text(text, style: TextStyle(
                color: value ? Colors.pink.shade100 : Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w400,
                decoration: value ? TextDecoration.lineThrough : TextDecoration.none
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
