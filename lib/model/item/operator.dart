import 'dart:math';

import 'package:developer_calculator/model/item/item.dart';

import '../operation_type.dart';
import 'number.dart';

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

  @override
  List<Item>? addToList(List<Item> items) {
    if (items.isNotEmpty && items.last is Number && (items.last as Number).value != "-") {
      return [...items, this];
    }
    if (type == OperatorType.subtract && (items.isEmpty || items.last is! Number || (items.last as Number).value != "-")) {
      if (items.isNotEmpty && items.last.toString() == ".") {
        return null;
      }
      return [...items, Number("-")];

    }
    return null;
  }
}