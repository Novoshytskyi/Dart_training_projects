void insertionSorting(List<int> sortList) {
  List<int> list = [...sortList];
  Stopwatch stopwatch = Stopwatch();

  stopwatch.start();
  List<int> insertionSortList = insertionSort(list);
  stopwatch.stop();
  print(
      '$insertionSortList - insertionSort - Время сортировки: ${stopwatch.elapsedMicroseconds} мкс.');
  stopwatch.reset();
}

List<int> insertionSort(List<int> list) {
  int length = list.length;

  for (int step = 1; step < length; step++) {
    int key = list[step];
    int j = step - 1;

    // Сравниваем key с каждым элементом слева от него, пока не будет
    // найден элемент, меньший его.
    // Для убывания измените key < array[j] на key > array[j].
    while (j >= 0 && key < list[j]) {
      list[j + 1] = list[j];
      j--;
    }

    // Поместите ключ после элемента, который немного меньше его.
    list[j + 1] = key;
  }
  return list;
}
