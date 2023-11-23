import 'package:developer_calculator/parser/tree/tree_item.dart';

import '../../lexer/token/token.dart';
import '../../lexer/token/token_operator.dart';
import '../../lexer/token/token_parenthesis.dart';

class TreeOperation extends TreeItem {
  TreeItem left;
  TreeItem right;
  OperatorType operation;

  TreeOperation(this.left, this.right, this.operation);

  static TreeOperation? tryConvert(List<Token> tokens) {
    int parenthesis = 0;
    int minParenthesis = -1;
    int minPriority = -1;
    int minIndex = -1;

    for (int i = 0; i < tokens.length; i++) {
      if (tokens[i] is TokenParenthesis) {
        if ((tokens[i] as TokenParenthesis).type == ParenthesisType.left) {
          parenthesis++;
        } else {
          parenthesis--;
          if (parenthesis < 0) {
            return null;
          }
        }
      }

      if (tokens[i] is TokenOperator) {
        if (minIndex == -1 || minParenthesis > parenthesis || (minParenthesis == parenthesis &&minPriority >= (tokens[i] as TokenOperator).operatorToInt())) {
          minIndex = i;
          minParenthesis = parenthesis;
          minPriority = (tokens[i] as TokenOperator).operatorToInt();
        }
      }
    }
    if (minPriority == -1) {
      return null;
    }

    TreeItem? left = TreeItem.tryConvert(tokens.sublist(0, minIndex));
    TreeItem? right = TreeItem.tryConvert(tokens.sublist(minIndex + 1));
    if (left == null || right == null) {
      return null;
    }

    return TreeOperation(left, right, (tokens[minIndex] as TokenOperator).operatorType);
  }

  @override
  double? compute() {
    double? leftValue = left.compute();
    double? rightValue = right.compute();

    if (leftValue == null || rightValue == null) {
      return null;
    }

    switch (operation) {
      case OperatorType.add:
        return leftValue + rightValue;
      case OperatorType.subtract:
        return leftValue - rightValue;
      case OperatorType.multiply:
        return leftValue * rightValue;
      case OperatorType.multiplyMaxPriority:
        return leftValue * rightValue;
      case OperatorType.divide:
        if (rightValue == 0) {
          return null;
        }
        return leftValue / rightValue;
      case OperatorType.divideInt:
        bool isNegative = false;
        if (leftValue < 0) {
          leftValue = -leftValue;
          isNegative = !isNegative;
        }
        if (rightValue < 0) {
          rightValue = -rightValue;
          isNegative = !isNegative;
        }
        int cnt = 0;
        if (rightValue == 0) {
          return null;
        }
        while (leftValue! >= rightValue) {
          leftValue -= rightValue;
          cnt++;
        }
        if (isNegative) {
          cnt = -cnt;
        }
        return cnt.toDouble();
      case OperatorType.modulo:
        if (rightValue == 0) {
          return null;
        }
        return leftValue % rightValue;
    }
  }
}