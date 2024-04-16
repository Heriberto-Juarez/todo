import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({
    super.key,
  });

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {

  bool isChecked = false;

  void checkboxCallback (bool newValue) {
    setState(() {
      isChecked = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
          "This is a task",
          style: TextStyle(decoration: (isChecked ? TextDecoration.lineThrough : null)),
      ),
      trailing: TaskCheckbox(checkboxState: isChecked,toggleCheckboxState: checkboxCallback,),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  final bool checkboxState;
  final Function toggleCheckboxState;
  const TaskCheckbox({super.key, required this.checkboxState, required this.toggleCheckboxState});
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkboxState,
      onChanged: (newValue) {
        toggleCheckboxState(newValue);
      },
    );
  }
}
