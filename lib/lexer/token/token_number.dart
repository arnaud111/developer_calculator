import 'package:developer_calculator/lexer/token/token.dart';

class TokenNumber extends Token {
  int value;

  TokenNumber(this.value);

  @override
  String toString() {
    return "TokenNumber($value)";
  }
}