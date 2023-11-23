import 'package:developer_calculator/model/item/item.dart';

import 'number.dart';

class Point extends Item {
  Point();

  @override
  String toString() {
    return '.';
  }

  @override
  List<Item>? addToList(List<Item> items) {
    if (items.isNotEmpty && items.last is Number && (items.last as Number).value != "-") {
      if (items.length > 2 && items[items.length - 2] is Point) {
        return null;
      }
      return [...items, this];
    }
    return null;
  }
}
