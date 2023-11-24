part of 'operation_bloc.dart';

@immutable
abstract class OperationEvent {}

class Init extends OperationEvent {}

class Remove extends OperationEvent {}

class Compute extends OperationEvent {}

class LoadOperation extends OperationEvent {

  final String operation;

  LoadOperation({
    required this.operation,
  });
}

class Move extends OperationEvent {

  final int index;

  Move({
    required this.index,
  });
}

class Add extends OperationEvent {
  final String append;

  Add({
    required this.append,
  });
}
