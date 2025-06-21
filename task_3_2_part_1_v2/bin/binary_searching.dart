void binarySearching(List<int> searchList, int searchedNumber) {
  List<int> list = [...searchList];
  int stepCount = 0;
  Stopwatch stopwatch = Stopwatch();

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
      stepCount++;
    }
    return -1;
  }

  stopwatch.start();

  int binarySearchIndex = binarySearch(list, searchedNumber);

  stopwatch.stop();

  print(
      '\x1B[32mbinarySearch\x1B[0m${binarySearchIndex != -1 ? ' - Число "$searchedNumber" - Индекс: "$binarySearchIndex"' : ' - Число "$searchedNumber" не найдено'} - Время поиска: ${stopwatch.elapsedMicroseconds} мкс. - \x1B[32mчисло шагов: $stepCount.\x1B[0m\n');

  stopwatch.reset();
}
