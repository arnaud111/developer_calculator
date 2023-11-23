part of 'operation_bloc.dart';

@immutable
abstract class OperationEvent {}

class Init extends OperationEvent {}

class Remove extends OperationEvent {}

class Add extends OperationEvent {
  final String append;

  Add({
    required this.append,
  });
}
