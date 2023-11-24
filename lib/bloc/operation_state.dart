part of 'operation_bloc.dart';

class OperationState {
  String operation;
  int cursor = 0;
  TreeItem? result;
  List<HistoryItem> history = [];

  OperationState({
    this.operation = "",
    this.cursor = 0,
  }) {
    createResult();
  }

  void createResult() {
    List<Token>? tokens = Lexer.compute(operation);
    if (tokens == null) {
      result = null;
      return;
    }
    result = Parser.compute(tokens);
    if (result is! TreeOperation) {
      result = null;
    }
  }

  OperationState copyWith({
    String? operation,
    int? cursor,
  }) {
    OperationState tmp = OperationState(
      operation: operation ?? this.operation,
      cursor: cursor ?? this.cursor,
    );
    tmp.history = history;
    return tmp;
  }

  void addHistory(double resultValue) {
    history.add(HistoryItem(
      operation: operation,
      resultValue: resultValue,
    ));
  }
}
