import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoey_flutter/screens/tasks/bloc/task_bloc.dart';
//import 'task_tile.dart';
import '../models/task.dart';

// class TaskList extends StatefulWidget {
//   const TaskList({super.key, required this.tasks});

//   final List<Task> tasks;

//   @override
//   State<TaskList> createState() => _TaskListState();
// }

// class _TaskListState extends State<TaskList> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemBuilder: (context, index) {
//         return ClipRRect(
//           borderRadius: BorderRadius.circular(15.0),
//           child: Dismissible(
//             key: ValueKey(
//                 widget.tasks[index].name),
//             onDismissed: (direction) {
//               BlocProvider.of<TaskBloc>(context)
//                   .add(DeleteTaskEvent(taskIndex: index));
//             },
//             background: Container(
//               color: Colors.red.shade400,
//               alignment: Alignment.centerRight,
//               padding: const EdgeInsets.only(right: 20.0),
//               child: const Icon(Icons.delete, color: Colors.white),
//             ),
//             child: TaskTile(
//               isChecked: widget.tasks[index].isDone,
//               taskTitle: widget.tasks[index].name,
//               checkBoxCallback: (bool? checkboxState) {
//                 BlocProvider.of<TaskBloc>(context).add(
//                     DoneTaskEvent(taskIndex: index));
//               },
//             ),
//           ),
//         );
//       },
//       itemCount: widget.tasks.length,
//     );
//   }
// }

class TaskList extends StatelessWidget {
  final List<Task> tasks;

  const TaskList({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];

        return ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Dismissible(
            key: Key(task.name),
            onDismissed: (direction) {
              BlocProvider.of<TaskBloc>(context)
                  .add(DeleteTaskEvent(taskIndex: index));
            },
            background: Container(
              color: Colors.red.shade400,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20.0),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: ListTile(
              title: Text(
                task.name,
                style: TextStyle(
                  decoration: task.isDone ? TextDecoration.lineThrough : null,
                ),
              ),
              trailing: Checkbox(
                activeColor: Colors.lightBlueAccent,
                value: task.isDone,
                onChanged: (newValue) {
                  BlocProvider.of<TaskBloc>(context)
                      .add(DoneTaskEvent(taskIndex: index));
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
