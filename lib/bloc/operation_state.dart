part of 'operation_bloc.dart';

class OperationState {
  List<Item> operation;

  OperationState({
    this.operation = const [],
  });

  @override
  String toString() {
    String result = "";

    for (final item in operation) {
      if (item is Operator) {
        result += " ${item.toString()} ";
        continue;
      }
      result += item.toString();
    }

    return result;
  }
}
