void linearSearching(List<int> searchList, int searchedNumber) {
  List<int> list = [...searchList];
  int stepCount = 0;
  Stopwatch stopwatch = Stopwatch();

  int linearSearch(List<int> list, int x) {
    int length = list.length;

    for (int i = 0; i < length; i++) {
      if (list[i] == x) {
        return i;
      }
      stepCount++;
    }
    return -1;
  }

  stopwatch.start();

  int linearSearchIndex = linearSearch(list, searchedNumber);

  stopwatch.stop();

  print(
      '\x1B[31mlinearSearch\x1B[0m${linearSearchIndex != -1 ? ' - Число "$searchedNumber" - Индекс: "$linearSearchIndex"' : ' - Число "$searchedNumber" не найдено'} - Время поиска: ${stopwatch.elapsedMicroseconds} мкс. - \x1B[31mчисло шагов: $stepCount.\x1B[0m\n');

  stopwatch.reset();
}
