void selectionSorting(List<int> sortList) {
  List<int> list = [...sortList];

  Stopwatch stopwatch = Stopwatch();

  stopwatch.start();

  List<int> selectionSortList = selectionSort(list);

  stopwatch.stop();

  print(
      '$selectionSortList - selectionSort - Время сортировки: ${stopwatch.elapsedMicroseconds} мкс.');

  stopwatch.reset();
}

List<int> selectionSort(List<int> list) {
  int length = list.length;

  for (int step = 0; step < length - 1; step++) {
    int minIndex = step;

    for (int i = step + 1; i < length; i++) {
      // Для сортировки по убыванию измените < на > в этой строке.
      // Выберите минимальный элемент в каждом цикле.
      if (list[i] < list[minIndex]) {
        minIndex = i;
      }
    }

    // поместите min в правильное положение
    int temp = list[step];
    list[step] = list[minIndex];
    list[minIndex] = temp;
  }
  return list;
}
