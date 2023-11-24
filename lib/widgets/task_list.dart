import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoey_flutter/screens/tasks/bloc/task_bloc.dart';
import 'task_tile.dart';
import '../models/task.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key, required this.tasks});

  final List<Task> tasks;

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Dismissible(
            key: ValueKey(
                widget.tasks[index].name), // Use task name as a unique key
            onDismissed: (direction) {
              BlocProvider.of<TaskBloc>(context)
                  .add(DeleteTaskEvent(taskIndex: index));
              // setState(() {
              //   widget.tasks.removeAt(index);
              // });
            },
            background: Container(
              color: Colors.red.shade400,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20.0),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: TaskTile(
              isChecked: widget.tasks[index].isDone,
              taskTitle: widget.tasks[index].name,
              checkBoxCallback: (bool? checkboxState) {
                // BlocProvider.of<TaskBloc>(context)
                //     .add(DoneTaskEvent(taskIndex: index));
                
                // setState(() {
                //   widget.tasks[index].toggleDone();
                // });
              
                if (checkboxState == true) {
                  BlocProvider.of<TaskBloc>(context)
                      .add(CompleteTaskEvent(taskIndex: index));
                } else if (checkboxState == false) {
                  BlocProvider.of<TaskBloc>(context)
                      .add(UncompleteTaskEvent(taskIndex: index));
                }
              },
            ),
          ),
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}
