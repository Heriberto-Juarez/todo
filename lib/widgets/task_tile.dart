import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.isChecked,
    required this.title,
    required this.checkboxCallback,
  });

  final bool isChecked;
  final String title;
  final Function checkboxCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
          title,
          style: TextStyle(decoration: (isChecked ? TextDecoration.lineThrough : null)),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (newValue) {
          checkboxCallback(newValue);
        },
      ),
    );
  }
}
