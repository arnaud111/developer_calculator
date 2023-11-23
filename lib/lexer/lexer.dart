import 'package:developer_calculator/lexer/token/token.dart';
import 'package:developer_calculator/lexer/token/token_number.dart';
import 'package:developer_calculator/lexer/token/token_operator.dart';
import 'package:developer_calculator/lexer/token/token_parenthesis.dart';
import 'package:developer_calculator/lexer/token/token_point.dart';

class Lexer {

  static List<Token>? compute(String input) {
    List<Token> tokens = [];
    int left = 0;
    int right = 0;

    for (right = 0; right < input.length; right++) {
      if (input[right] == "*" || input[right] == "/" || input[right] == "%" || input[right] == "+" || input[right] == "-") {
        if (left != right) {
          tokens.add(TokenNumber(int.parse(input.substring(left, right))));
        }

        switch (input[right]) {
          case "*":
            tokens.add(TokenOperator.multiply());
            break;
          case "/":
            tokens.add(TokenOperator.divide());
            if (right + 1 < input.length && input[right + 1] == "/") {
              tokens.add(TokenOperator.divideInt());
              right++;
            }
            break;
          case "%":
            tokens.add(TokenOperator.modulo());
            break;
          case "+":
            tokens.add(TokenOperator.add());
            break;
          case "-":
            tokens.add(TokenOperator.subtract());
            break;
        }

        left = right + 1;
      } else if (input[right] == ".") {
        if (left != right) {
          tokens.add(TokenNumber(int.parse(input.substring(left, right))));
        }

        tokens.add(TokenPoint());
        left = right + 1;
      } else if (input[right] == "(") {
        if (left != right) {
          tokens.add(TokenNumber(int.parse(input.substring(left, right))));
        }

        tokens.add(TokenParenthesis.left());
        left = right + 1;
      } else if (input[right] == ")") {
        if (left != right) {
          tokens.add(TokenNumber(int.parse(input.substring(left, right))));
        }

        tokens.add(TokenParenthesis.right());
        left = right + 1;
      }
    }

    if (left != right) {
      tokens.add(TokenNumber(int.parse(input.substring(left, right))));
    }

    return tokens;
  }
}