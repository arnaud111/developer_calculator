part of 'operation_bloc.dart';

@immutable
abstract class OperationEvent {}

class Init extends OperationEvent {}

class Remove extends OperationEvent {}

class Add extends OperationEvent {
  final Item append;

  Add({
    required this.append,
  });
}
