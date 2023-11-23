import 'dart:math';

import 'package:developer_calculator/model/item/item.dart';

class Number extends Item {
  String value = "";

  Number(this.value);

  void addNumber(String number, bool afterPoint) {
    if (!afterPoint && value == "0") {
      value = number;
    } else {
      value = value + number;
    }
  }

  void removeNumber() {
    value = value.substring(0, value.length - 1);
  }

  @override
  String toString() {
    return value.toString();
  }

  @override
  List<Item>? addToList(List<Item> items) {
    if (items.isNotEmpty && items.last is Number) {
      (items.last as Number).addNumber(value, items.length > 2 && items[items.length - 2].toString() == ".");
      return items;
    }
    return [...items, this];
  }
}