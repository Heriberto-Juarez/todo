import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';
import 'package:todo/screens/add_task_screen.dart';

import '../widgets/tasks_list.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {

  List<Task> tasks = [
    Task(name: 'Buy milk', isDone: false),
    Task(name: 'Buy eggs', isDone: false),
    Task(name: 'Buy bread', isDone: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) => AddTaskScreen(addTaskCallback: (task) {
                    setState(() {
                      tasks.add(Task(name: task, isDone: false));
                    });
                },)
            );
          }),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.only(
              top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30.0,
                child: Icon(
                  Icons.list,
                  size: 30.0,
                  color: Colors.lightBlue,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "Todo",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "${tasks.length} Tasks",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)),
            ),
            child: TasksList(tasks: tasks),
          ),
        ),
      ]),
    );
  }
}



