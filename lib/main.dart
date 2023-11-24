import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoey_flutter/screens/tasks/bloc/task_bloc.dart';
import 'screens/tasks/views/tasks_screen.dart';
import '/screens/tasks/controller/controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(controller: Controller()),
      child: const MaterialApp(
        home: TaskScreen(),
      ),
    );
  }
}
