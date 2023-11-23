import 'package:developer_calculator/lexer/token/token_operator.dart';
import 'package:developer_calculator/parser/tree/tree_item.dart';

import '../lexer/token/token.dart';
import '../lexer/token/token_number.dart';
import '../lexer/token/token_parenthesis.dart';

class Parser {
  static TreeItem? compute(List<Token> tokens) {
    return TreeItem.tryConvert(mergeNegativeToken(tokens));
  }

  static List<Token> mergeNegativeToken(List<Token> tokens) {
    List<Token> result = [];

    for (int i = 0; i < tokens.length; i++) {
      if (tokens[i] is TokenOperator &&
          (tokens[i] as TokenOperator).operatorType == OperatorType.subtract &&
          (i == 0 || tokens[i - 1] is TokenOperator || tokens[i - 1] is TokenParenthesis)) {
        result.add(TokenNumber("-1"));
        result.add(TokenOperator.multiplyMaxPriority());
        continue;
      }
      result.add(tokens[i]);
    }

    return result;
  }
}
