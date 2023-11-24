part of 'task_bloc.dart';

sealed class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class AddTaskEvent extends TaskEvent {
  final Task task;

  const AddTaskEvent({required this.task});

  @override
  List<Object> get props => [task];
}

class DeleteTaskEvent extends TaskEvent {
  final int taskIndex;

  const DeleteTaskEvent({required this.taskIndex});

  @override
  List<Object> get props => [taskIndex];
}

class EditTaskEvent extends TaskEvent {}

// class DoneTaskEvent extends TaskEvent {
//   final int taskIndex;

//   const DoneTaskEvent({required this.taskIndex});

//   @override
//   List<Object> get props => [taskIndex];
// }

// Evento para marcar una tarea como completada
class CompleteTaskEvent extends TaskEvent {
  final int taskIndex;

  const CompleteTaskEvent({required this.taskIndex});

  @override
  List<Object> get props => [taskIndex];
}

// Evento para desmarcar una tarea
class UncompleteTaskEvent extends TaskEvent {
  final int taskIndex;

  const UncompleteTaskEvent({required this.taskIndex});

  @override
  List<Object> get props => [taskIndex];
}
