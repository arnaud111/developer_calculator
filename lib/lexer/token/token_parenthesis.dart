
import 'package:developer_calculator/lexer/token/token.dart';

enum ParenthesisType {
  left,
  right,
}

class TokenParenthesis extends Token {
  ParenthesisType type;

  TokenParenthesis(this.type);

  static TokenParenthesis left() {
    return TokenParenthesis(ParenthesisType.left);
  }

  static TokenParenthesis right() {
    return TokenParenthesis(ParenthesisType.right);
  }

  @override
  String toString() {
    return "TokenParenthesis($type)";
  }
}
