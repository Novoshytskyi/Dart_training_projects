import 'dart:io';

import 'binary_searching.dart';
import 'dart_searching.dart';
import 'functions.dart';
import 'linear_searching.dart';

void main(List<String> arguments) {
  String? incomingParameter1;
  String? incomingParameter2;
  List<int> dataList = [];
  int searchedNumber = 0;

  stdout.write('Введите размер массива: ');
  incomingParameter1 = stdin.readLineSync().toString().trim();

  if (isNumber(incomingParameter1)) {
    dataList = getRandomListByLenght(incomingParameter1);
    print(dataList);
  } else {
    return;
  }

  stdout.write('\nВведите искомое число: ');
  incomingParameter2 = stdin.readLineSync().toString().trim();
  print('');

  if (isNumber(incomingParameter2)) {
    searchedNumber = int.parse(incomingParameter2);
  } else {
    return;
  }

  dartSearching(dataList, searchedNumber);

  linearSearching(dataList, searchedNumber);

  binarySearching(dataList, searchedNumber);
}
