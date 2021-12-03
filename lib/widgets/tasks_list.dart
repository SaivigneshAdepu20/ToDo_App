import 'package:flutter/material.dart';
// import 'package:to_do_app/models/task.dart';
import 'package:to_do_app/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/task_data.dart';

class TasksList extends StatefulWidget {
  // final List<Task> tasks;
  const TasksList({
    Key? key,
    // required this.tasks,
  }) : super(key: key);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(task);
                // setState(
                //   () {
                //     widget.tasks[index].toggleDone();
                //   },
                // );
              },
              longpressCallback: () {
                taskData.deleteTask(task);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
    // (
    //   physics: const BouncingScrollPhysics(),
    //   children: <Widget>[
    //     TaskTile(
    //       taskTitle: tasks[0].name,
    //       isChecked: tasks[0].isDone,
    //     ),
    //     TaskTile(
    //       taskTitle: tasks[1].name,
    //       isChecked: tasks[1].isDone,
    //     ),
    //     TaskTile(
    //       taskTitle: tasks[2].name,
    //       isChecked: tasks[2].isDone,
    //     ),
    //     // ListTile(
    //     //   title: Text('this is task2'),
    //     //   trailing: Checkbox(
    //     //     value: false,
    //     //     onChanged: null,
    //     //   ),
    //     // ),
    //   ],
    // );
  }
}
