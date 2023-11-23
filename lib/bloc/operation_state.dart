part of 'operation_bloc.dart';

class OperationState {
  String operation;
  TreeItem? result;

  OperationState({
    this.operation = "",
  }) {
    createResult();
  }

  @override
  String toString() {
    return operation;
  }

  void createResult() {
    List<Token>? tokens = Lexer.compute(operation);
    if (tokens == null || tokens.length < 2) {
      result = null;
      return;
    }
    result = Parser.compute(tokens);
  }

}
