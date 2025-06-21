import 'selection_sorting.dart';

void linearSearching(List<int> searchList, int searchedNumber) {
  List<int> list = [...searchList];

  Stopwatch stopwatch = Stopwatch();

  list = selectionSort(list);

  stopwatch.start();

  int linearSearchIndex = linearSearch(list, searchedNumber);

  stopwatch.stop();

  print(
      '${linearSearchIndex != -1 ? 'linearSearch - Число "$searchedNumber" - Индекс: "$linearSearchIndex"' : 'linearSearch - Число "$searchedNumber" не найдено'} - Время поиска: ${stopwatch.elapsedMicroseconds} мкс.');

  stopwatch.reset();
}

int linearSearch(List<int> list, int x) {
  int length = list.length;

  for (int i = 0; i < length; i++) {
    if (list[i] == x) {
      return i;
    }
  }
  return -1;
}
