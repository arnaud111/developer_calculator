import 'package:developer_calculator/model/tree/value.dart';

import 'operator_tree.dart';

class TreeItem {

  double? getValue() {
    if (this is Value) {
      return (this as Value).value;
    } else if (this is OperatorTree) {
      return (this as OperatorTree).compute()?.value;
    } else {
      throw Exception("Unknown type");
    }
  }

  static TreeItem? parse(List<TreeItem> list) {

    int minIndex = -1;
    int min = -1;

    if (list.length == 1 && list[0] is Value) {
      return list[0];
    }

    for (int i = 0; i < list.length; i++) {
      if (list[i] is OperatorTree) {
        if (min == -1 || (list[i] as OperatorTree).operatorToInt() < min) {
          min = (list[i] as OperatorTree).operatorToInt();
          minIndex = i;
        }
      }
    }

    if (minIndex != -1) {
      OperatorTree operatorTree = list[minIndex] as OperatorTree;
      operatorTree.left = parse(list.sublist(0, minIndex));
      operatorTree.right = parse(list.sublist(minIndex + 1));
      if (operatorTree.left == null || operatorTree.right == null) {
        return null;
      }
      return operatorTree;
    }

    return null;
  }
}
