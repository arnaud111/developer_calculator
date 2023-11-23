import 'package:developer_calculator/lexer/token/token.dart';

class TokenNumber extends Token {
  String value;

  TokenNumber(this.value);

  @override
  String toString() {
    return "TokenNumber($value)";
  }
}