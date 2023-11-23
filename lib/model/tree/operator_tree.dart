import 'package:developer_calculator/model/tree/tree_item.dart';
import 'package:developer_calculator/model/tree/value.dart';

import '../item/operator.dart';
import '../operation_type.dart';

class OperatorTree extends TreeItem {
  TreeItem? left;
  OperatorType type;
  TreeItem? right;

  OperatorTree({
    this.left,
    required this.type,
    this.right,
  });

  static fromOperator(Operator operator) {
    return OperatorTree(
      type: operator.type,
    );
  }

  int operatorToInt() {
    switch (type) {
      case OperatorType.add:
        return 0;
      case OperatorType.subtract:
        return 1;
      case OperatorType.multiply:
        return 2;
      case OperatorType.divide:
        return 3;
      case OperatorType.divideInt:
        return 4;
      case OperatorType.modulo:
        return 5;
    }
  }

  Value? compute() {

    if (left == null || right == null) {
      return null;
    }

    double? leftValue = left!.getValue();
    double? rightValue = right!.getValue();

    if (leftValue == null || rightValue == null) {
      return null;
    }

    switch (type) {
      case OperatorType.add:
        return Value(leftValue + rightValue);
      case OperatorType.subtract:
        return Value(leftValue - rightValue);
      case OperatorType.multiply:
        return Value(leftValue * rightValue);
      case OperatorType.divide:
        if (rightValue == 0) {
          return null;
        }
        return Value(leftValue / rightValue);
      case OperatorType.divideInt:
        int cnt = 0;
        if (rightValue == 0) {
          return null;
        }
        while (leftValue! >= rightValue) {
          leftValue -= rightValue;
          cnt++;
        }
        return Value(cnt.toDouble());
      case OperatorType.modulo:
        if (rightValue == 0) {
          return null;
        }
        return Value(leftValue % rightValue);
    }
  }
}
