import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/screens/tasks/controller/controller.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  Controller controller;

  TaskBloc({required this.controller})
      : super(TaskInitialState(tasks: controller.tasks)) {
    on<AddTaskEvent>((event, emit) {
      controller.tasks.add(event.task);
      emit(AddedTaskState(tasks: controller.tasks));
    });
    // on<DoneTaskEvent>((event, emit) {
    //   controller.tasks[event.taskIndex].toggleDone();
    //   bool isDone = controller.tasks[event.taskIndex].isDone;
    //   emit(MarkDoneTaskState(tasks: controller.tasks, isDone: true));
    // });
    on<CompleteTaskEvent>((event, emit) {
      controller.tasks[event.taskIndex].markAsDone();
      emit(MarkedAsDoneState(tasks: List.from(controller.tasks)));
    });

    on<UncompleteTaskEvent>((event, emit) {
      controller.tasks[event.taskIndex].markAsUndone();
      emit(MarkedAsUndoneState(tasks: List.from(controller.tasks)));
    });

    on<DeleteTaskEvent>((event, emit) {
      controller.tasks.removeAt(event.taskIndex);
      emit(AddedTaskState(tasks: List.from(controller.tasks)));
    });
  }
}
