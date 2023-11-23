import 'package:developer_calculator/lexer/token/token.dart';
import 'package:developer_calculator/lexer/token/token_number.dart';
import 'package:developer_calculator/lexer/token/token_point.dart';
import 'package:developer_calculator/parser/tree/tree_item.dart';

class TreeNumber extends TreeItem {

  double value;

  TreeNumber(this.value);

  static TreeNumber? tryConvert(List<Token> tokens) {
    if (tokens.length == 1 && tokens[0] is TokenNumber) {
      return TreeNumber(double.parse("${(tokens[0] as TokenNumber).value}"));
    }
    if (tokens.length == 3 && tokens[1] is TokenPoint && tokens[0] is TokenNumber && tokens[2] is TokenNumber) {
      return TreeNumber(double.parse("${(tokens[0] as TokenNumber).value}.${(tokens[2] as TokenNumber).value}"));
    }
    return null;
  }

  @override
  double? compute() {
    return value;
  }
}