import 'dart:math';

import 'sorter.dart';
import 'color_printing_in_console.dart';

void main(List<String> arguments) {
  List<int> dataList = [];
  var rng = Random();

  for (int i = 0; i < 15; i++) {
    dataList.add(rng.nextInt(100));
  }

  dataList = [35, 21, 72, 69, 48, 97, 9, 4, 39, 93, 19, 48, 13, 54, 75]; //?

  printYellow('dataList\n$dataList');

  // print('===' * 36);

  print(Sorter.dartSorting(dataList).toString());

  print(Sorter.bubbleSorting(dataList).toString());

  print(Sorter.bubbleSortingOptimized(dataList).toString());

  print(Sorter.selectionSorting(dataList).toString());

  print(Sorter.insertionSorting(dataList).toString());

  printYellow('\nисходный dataList не изменился\n$dataList');
}
