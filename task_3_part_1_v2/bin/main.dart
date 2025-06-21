import 'dart:math';

import 'binary_searching.dart';
import 'bubble_sorting.dart';
import 'dart_searching.dart';
import 'dart_sorting.dart';
import 'insertion_sorting.dart';
import 'linear_searching.dart';
import 'selection_sorting.dart';

void main(List<String> arguments) {
  List<int> dataList = [];
  var rng = Random();

  for (int i = 0; i < 15; i++) {
    dataList.add(rng.nextInt(100));
  }

  print('$dataList - dataList\n');

  dartSorting(dataList);

  bubbleSorting(dataList);

  bubbleSortingOptimized(dataList);

  selectionSorting(dataList);

  insertionSorting(dataList);

  int searchedNumber = 25;

  print('\n\t Поиск числа "$searchedNumber" в отсотрированом списке.');

  dartSearching(dataList, searchedNumber);

  linearSearching(dataList, searchedNumber);

  binarySearching(dataList, searchedNumber);

  print('\n$dataList - исходный dataList не изменялся.');
}
