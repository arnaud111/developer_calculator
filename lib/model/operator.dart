import 'package:developer_calculator/model/item.dart';

enum OperatorType {
  add,
  subtract,
  multiply,
  divide,
  divideInt,
  modulo,
  equal,
}

class Operator extends Item {

  OperatorType type;

  Operator(this.type);

  @override
  String toString() {
    switch (type) {
      case OperatorType.add:
        return '+';
      case OperatorType.subtract:
        return '-';
      case OperatorType.multiply:
        return '*';
      case OperatorType.divide:
        return '/';
      case OperatorType.divideInt:
        return '//';
      case OperatorType.modulo:
        return '%';
      case OperatorType.equal:
        return '=';
    }
  }

  static Operator add() {
    return Operator(OperatorType.add);
  }

  static Operator subtract() {
    return Operator(OperatorType.subtract);
  }

  static Operator multiply() {
    return Operator(OperatorType.multiply);
  }

  static Operator divide() {
    return Operator(OperatorType.divide);
  }

  static Operator divideInt() {
    return Operator(OperatorType.divideInt);
  }

  static Operator modulo() {
    return Operator(OperatorType.modulo);
  }

  static Operator equal() {
    return Operator(OperatorType.equal);
  }
}