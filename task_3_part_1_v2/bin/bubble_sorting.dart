void bubbleSorting(List<int> sortList) {
  List<int> list = [...sortList];

  Stopwatch stopwatch = Stopwatch();

  stopwatch.start();

  List<int> bubbleSortList = bubbleSort(list);

  stopwatch.stop();

  print(
      '$bubbleSortList - bubbleSort - Время сортировки: ${stopwatch.elapsedMicroseconds} мкс.');

  stopwatch.reset();
}

void bubbleSortingOptimized(List<int> sortList) {
  List<int> list = [...sortList];

  Stopwatch stopwatch = Stopwatch();

  stopwatch.start();

  List<int> bubbleSortOptimizedList = bubbleSortOptimized(list);

  stopwatch.stop();

  print(
      '$bubbleSortOptimizedList - bubbleSortOptimized - Время сортировки: ${stopwatch.elapsedMicroseconds} мкс.');

  stopwatch.reset();
}

List<int> bubbleSort(List<int> list) {
  int length = list.length;

  // цикл для доступа к каждому элементу списка
  for (int i = 0; i < length - 1; i++) {
    // цикл для сравнения элементов списка
    for (int j = 0; j < length - i - 1; j++) {
      // сравнить два соседних элемента
      // измените > на < для сортировки по убыванию
      if (list[j] > list[j + 1]) {
        // обмен происходит, если элементы не находятся в предполагаемом порядке
        int temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;
      }
    }
  }
  return list;
}

List<int> bubbleSortOptimized(List<int> list) {
  int length = list.length;

  // цикл для доступа к каждому элементу списка
  for (int i = 0; i < (length - 1); i++) {
    // проверяем, происходит ли обмен
    bool swapped = false;

    // цикл для сравнения соседних элементов
    for (int j = 0; j < (length - i - 1); j++) {
      // сравнить два элемента массива
      // изменить > на < для сортировки по убыванию
      if (list[j] > list[j + 1]) {
        // обмен происходит, если элементы не находятся в предполагаемом порядке
        int temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;

        swapped = true;
      }
    }
    // отсутствие обмена означает, что массив уже отсортирован
    // поэтому нет необходимости в дальнейшем сравнении
    if (!swapped) break;
  }
  return list;
}
