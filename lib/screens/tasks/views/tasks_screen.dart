import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoey_flutter/screens/tasks/bloc/task_bloc.dart';
import '../../../widgets/task_list.dart';
import 'add_task_screen.dart';
import '../../../models/task.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(addTaskCallback: (newTask) {
                  BlocProvider.of<TaskBloc>(context)
                      .add(AddTaskEvent(task: newTask));

                  // Navigator.pop(context);
                }),
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          print(state);
          if (state is AddedTaskState) {
            tasks = List.from(state.tasks);
            //final List<Task> tasks = (state as dynamic).tasks;
            return _showUI(tasks);
          } else if (state is MarkedAsDoneState) {
            tasks = List.from(state.tasks);
            //final List<Task> tasks = (state as dynamic).tasks;
            return _showUI(tasks);
          } else if (state is MarkedAsUndoneState) {
            tasks = List.from(state.tasks);
            //final List<Task> tasks = (state as dynamic).tasks;
            return _showUI(tasks);
          } else if (state is TaskInitialState) {
            tasks = List.from(state.tasks);
            //final List<Task> tasks = (state as dynamic).tasks;
            return _showUI(tasks);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Column _showUI(List<Task> tasksMethod) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                  color: Colors.lightBlueAccent,
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Todoey',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '${tasksMethod.length} Tasks',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: TaskList(tasks: tasksMethod),
          ),
        ),
      ],
    );
  }
}
