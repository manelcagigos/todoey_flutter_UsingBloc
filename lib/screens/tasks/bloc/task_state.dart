part of 'task_bloc.dart';

sealed class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

final class TaskInitialState extends TaskState {
  final List<Task> tasks;

  const TaskInitialState({required this.tasks});

  @override
  List<Object> get props => [tasks];
}

class AddedTaskState extends TaskState {
  final List<Task> tasks;

  const AddedTaskState({required this.tasks});

  @override
  List<Object> get props => [tasks];
}

// class MarkDoneTaskState extends TaskState {
//   final List<Task> tasks;
//   final bool isDone;

//   const MarkDoneTaskState({required this.tasks, required this.isDone});

//   @override
//   List<Object> get props => [tasks, isDone];
// }


class MarkedAsDoneState extends TaskState {
  final List<Task> tasks;

  const MarkedAsDoneState({required this.tasks});

  @override
  List<Object> get props => [tasks];
}

class MarkedAsUndoneState extends TaskState {
  final List<Task> tasks;

  const MarkedAsUndoneState({required this.tasks});

  @override
  List<Object> get props => [tasks];
}

class DeletedTaskState extends TaskState {
  final List<Task> tasks;

  const DeletedTaskState({required this.tasks});

  @override
  List<Object> get props => [tasks];
}
