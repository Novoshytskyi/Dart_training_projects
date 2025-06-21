import 'dart:math';

import 'sorters/bubble_sorter.dart';
import 'sorters/bubble_optimized_sorter.dart';
import 'sorters/default_dart_sorter.dart';
import 'sorters/insertion_sorter.dart';
import 'sorters/merge_sorter.dart';
import 'sorters/quick_sorter.dart';
import 'sorters/selection_sorter.dart';
import 'sorters/shell_sorter.dart';

void main(List<String> arguments) {
  List<int> dataList = [];
  var rng = Random();

  for (int i = 0; i < 15000; i++) {
    dataList.add(rng.nextInt(100));
  }

  //========================================================

  // print('\x1B[33mdataList\n$dataList\x1B[0m');

  // print(DefaultDartSorter.getSortedList(dataList));

  // print(BubbleSorter.getSortedList(dataList));

  // print(BubbleOptimizedSorter.getSortedList(dataList));

  // print(QuickSorter.getSortedList(dataList));

  // print(SelectionSorter.getSortedList(dataList));

  // print(InsertionSorter.getSortedList(dataList));

  // print(ShellSorter.getSortedList(dataList));

  // print(MergeSorter.getSortedList(dataList));

  // print('\n\x1B[33mИсходный dataList не изменился\n$dataList\x1B[0m');

  //========================================================

  DefaultDartSorter.getSortedList(dataList);

  BubbleSorter.getSortedList(dataList);

  BubbleOptimizedSorter.getSortedList(dataList);

  QuickSorter.getSortedList(dataList);

  SelectionSorter.getSortedList(dataList);

  InsertionSorter.getSortedList(dataList);

  ShellSorter.getSortedList(dataList);

  MergeSorter.getSortedList(dataList);
}
