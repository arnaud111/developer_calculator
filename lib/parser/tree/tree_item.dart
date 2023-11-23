import 'package:developer_calculator/parser/tree/tree_number.dart';
import 'package:developer_calculator/parser/tree/tree_operation.dart';

import '../../lexer/token/token.dart';
import '../../lexer/token/token_parenthesis.dart';

abstract class TreeItem {
  double? compute();

  static TreeItem? tryConvert(List<Token> tokens) {
    TreeItem? result;

    tokens = removeGlobalParenthesis(tokens);

    result = TreeNumber.tryConvert(tokens);
    if (result == null) {
      return TreeOperation.tryConvert(tokens);
    }
    return result;
  }

  static List<Token> removeGlobalParenthesis(List<Token> tokens) {
    int parenthesis = 0;

    if (tokens.length < 3) {
      return tokens;
    }

    if (tokens[0] is! TokenParenthesis ||
        tokens[tokens.length - 1] is! TokenParenthesis ||
        (tokens[0] as TokenParenthesis).type != ParenthesisType.left ||
        (tokens[tokens.length - 1] as TokenParenthesis).type != ParenthesisType.right) {
      return tokens;
    }

    for (int i = 0; i < tokens.length - 1; i++) {
      if (tokens[i] is TokenParenthesis) {
        if ((tokens[i] as TokenParenthesis).type == ParenthesisType.left) {
          parenthesis++;
        } else {
          parenthesis--;
        }
      }
      if (parenthesis == 0) {
        return tokens;
      }
    }

    return tokens.sublist(1, tokens.length - 1);
  }
}
