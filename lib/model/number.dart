import 'package:developer_calculator/model/item.dart';

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
}