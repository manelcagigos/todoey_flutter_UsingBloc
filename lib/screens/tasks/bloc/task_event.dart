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

class DoneTaskEvent extends TaskEvent {
  final int taskIndex;

  const DoneTaskEvent({required this.taskIndex});

  @override
  List<Object> get props => [taskIndex];
}
