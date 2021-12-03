import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function longpressCallback;
  // ignore: use_key_in_widget_constructors
  const TaskTile({
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallback,
    required this.longpressCallback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails dragEndDetails) {
        longpressCallback();
      },
      child: ListTile(
        onLongPress: () {
          longpressCallback();
        },
        title: Text(
          taskTitle,
          style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: (newValue) {
            checkboxCallback(newValue);
          },
          // toggleCheckboxState,
        ),
      ),
    );
  }
}
