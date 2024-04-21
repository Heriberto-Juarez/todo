import 'package:flutter/material.dart';
import 'package:todo/widgets/task_tile.dart';

import '../models/task.dart';

class TasksList extends StatefulWidget {

  TasksList({
    super.key,
    required this.tasks
  });

  List<Task> tasks;

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return TaskTile(
          isChecked: widget.tasks[index].isDone,
          title: widget.tasks[index].name,

          checkboxCallback: (bool value) {
            setState(() {
              widget.tasks[index].toggleDone();
            });
          },
      );
    }, itemCount: widget.tasks.length,);
  }
}