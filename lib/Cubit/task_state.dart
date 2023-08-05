part of 'task_cubit.dart';

@immutable
abstract class TaskState {}

class TaskInitial extends TaskState {}
class Dataloading extends TaskState {}
class DataSuccess extends TaskState {}
class DataFailure extends TaskState {}
class ChangeFinish extends TaskState{}