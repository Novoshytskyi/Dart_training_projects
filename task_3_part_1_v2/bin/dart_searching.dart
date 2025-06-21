import 'selection_sorting.dart';

void dartSearching(List<int> searchList, int searchedNumber) {
  List<int> list = [...searchList];

  Stopwatch stopwatch = Stopwatch();

  list = selectionSort(list);

  stopwatch.start();

  int dartSearchIndex = list.indexOf(searchedNumber);

  stopwatch.stop();

  print(
      '${dartSearchIndex != -1 ? 'dartSearch   - Число "$searchedNumber" - Индекс: "$dartSearchIndex"' : 'dartSearch   - Число "$searchedNumber" не найдено'} - Время поиска: ${stopwatch.elapsedMicroseconds} мкс.');

  stopwatch.reset();
}
