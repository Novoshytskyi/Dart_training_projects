// import 'dart:io';

import 'functions.dart';

void main(List<String> arguments) {
  // String? equation;

  // stdout.write('Введите уравнение: ');

  // equation = stdin.readLineSync().toString().trim();

  // checkingCorrectnessParentheses(equation);

  checkingCorrectnessParentheses('x * (y - 10)');
  checkingCorrectnessParentheses('a * (b + c))');
  checkingCorrectnessParentheses(')(');
  checkingCorrectnessParentheses('()()');
  checkingCorrectnessParentheses('5 * (lg(x) + 10)');
  checkingCorrectnessParentheses('(x)(y)(z)');
  checkingCorrectnessParentheses('123');
}
