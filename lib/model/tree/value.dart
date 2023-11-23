import 'package:developer_calculator/model/tree/tree_item.dart';

class Value extends TreeItem {
  final double value;

  Value(this.value);

  factory Value.parse(String value) {
    return Value(double.parse(value));
  }

  @override
  String toString() {
    return value.toString();
  }
}