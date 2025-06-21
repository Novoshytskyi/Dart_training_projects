import 'selection_sorting.dart';

void binarySearching(List<int> searchList, int searchedNumber) {
  List<int> list = [...searchList];

  Stopwatch stopwatch = Stopwatch();

  list = selectionSort(list);

  stopwatch.start();

  int binarySearchIndex = binarySearch(list, searchedNumber);

  stopwatch.stop();

  print(
      '${binarySearchIndex != -1 ? 'binarySearch - Число "$searchedNumber" - Индекс: "$binarySearchIndex"' : 'binarySearch - Число "$searchedNumber" не найдено'} - Время поиска: ${stopwatch.elapsedMicroseconds} мкс.');

  stopwatch.reset();
}

int binarySearch(List<int> list, int x) {
  int minIndex = 0;
  int maxIndex = list.length - 1;

  while (minIndex <= maxIndex) {
    final midIndex = (minIndex + maxIndex) ~/ 2;
    final midValue = list[midIndex];

    if (midValue == x) {
      return midIndex;
    }

    if (midValue > x) {
      maxIndex = midIndex - 1;
    } else {
      minIndex = midIndex + 1;
    }
  }
  return -1;
}
