part of 'operation_bloc.dart';

class OperationState {
  List<Item> operation;
  TreeItem? result;

  OperationState({
    this.operation = const [],
  }) {
    createResult();
  }

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

  void createResult() {
    List<TreeItem> treeItems = [];

    if (operation.isEmpty || operation.last is Operator) {
      return;
    }

    for (int i = 0; i < operation.length; i++) {
      if (operation[i] is Operator) {
        treeItems.add(OperatorTree.fromOperator(operation[i] as Operator));
      } else {
        if (operation.length > i + 1 && operation[i + 1].toString() == ".") {
          if (operation.length > i + 2 && operation[i + 2] is Number) {
            treeItems.add(Value.parse("${(operation[i] as Number).value}.${(operation[i + 2] as Number).value}"));
            i += 2;
          } else {
            return;
          }
        } else {
          if (operation[i].toString() == "-") {
            return;
          }
          treeItems.add(Value.parse((operation[i] as Number).value));
        }
      }
    }
    result = TreeItem.parse(treeItems);
  }

}
