import 'package:developer_calculator/lexer/token/token.dart';

enum OperatorType {
  add,
  subtract,
  multiply,
  divide,
  divideInt,
  modulo,
  multiplyMaxPriority,
}

class TokenOperator extends Token {

  OperatorType operatorType;

  TokenOperator(this.operatorType);

  int operatorToInt() {
    switch (operatorType) {
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
      case OperatorType.multiplyMaxPriority:
        return 6;
    }
  }

  static TokenOperator add() {
    return TokenOperator(OperatorType.add);
  }

  static TokenOperator subtract() {
    return TokenOperator(OperatorType.subtract);
  }

  static TokenOperator multiply() {
    return TokenOperator(OperatorType.multiply);
  }

  static TokenOperator divide() {
    return TokenOperator(OperatorType.divide);
  }

  static TokenOperator divideInt() {
    return TokenOperator(OperatorType.divideInt);
  }

  static TokenOperator modulo() {
    return TokenOperator(OperatorType.modulo);
  }

  static TokenOperator multiplyMaxPriority() {
    return TokenOperator(OperatorType.multiplyMaxPriority);
  }

  @override
  String toString() {
    return "TokenOperator($operatorType)";
  }
}
