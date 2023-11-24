part of 'operation_bloc.dart';

class OperationState {
  String operation;
  int cursor = 0;
  TreeItem? result;

  OperationState({
    this.operation = "",
    this.cursor = 0,
  }) {
    createResult();
  }

  void createResult() {
    List<Token>? tokens = Lexer.compute(operation);
    if (tokens == null || tokens.length < 3) {
      result = null;
      return;
    }
    result = Parser.compute(tokens);
  }

  OperationState copyWith({
    String? operation,
    int? cursor,
  }) {
    return OperationState(
      operation: operation ?? this.operation,
      cursor: cursor ?? this.cursor,
    );
  }
}
