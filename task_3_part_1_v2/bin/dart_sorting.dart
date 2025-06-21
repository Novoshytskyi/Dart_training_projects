void dartSorting(List<int> sortList) {
  List<int> list = [...sortList];

  Stopwatch stopwatch = Stopwatch();

  stopwatch.start();

  list.sort();

  stopwatch.stop();

  print(
      '$list - dartSort - Время сортировки: ${stopwatch.elapsedMicroseconds} мкс.');

  stopwatch.reset();
}
