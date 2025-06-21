import 'stack.dart';

void checkingCorrectnessParentheses(String equation) {
  if (!equation.contains('(') && !equation.contains(')')) {
    print('В веденном выражении: $equation, скобок нет.');
    return;
  }
  print(
      'В уравнении: $equation,  правильность скобок ${isCorrectParentheses(equation) ? '' : 'НЕ '}соблюдена.');
}

bool isCorrectParentheses(String equation) {
  var stack = Stack<String>();

  for (int i = 0; i < equation.length; i++) {
    if (equation[i] == '(') {
      stack.push('(');
    } else if (equation[i] == ')') {
      if (stack.isEmpty) {
        return false;
      } else {
        stack.pop();
      }
    }
  }

  return stack.isEmpty;
}
