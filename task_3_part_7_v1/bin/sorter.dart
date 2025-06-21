class Sorter {
  // static Stopwatch _stopwatch = Stopwatch();

  static List<int> dartSorting(List<int> sortList) {
    List<int> list = [...sortList];

    Stopwatch stopwatch = Stopwatch();

    stopwatch.start();

    list.sort();

    stopwatch.stop();

    _printResultTime('dartSort', stopwatch.elapsedMicroseconds);

    stopwatch.reset();

    // _timer('dartSort', () => list.sort());
    // _timer('dartSort', () => [...sortList].sort());
    return list;
  }

  static List<int> bubbleSorting(List<int> sortList) {
    List<int> list = [...sortList];

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

    Stopwatch stopwatch = Stopwatch();

    stopwatch.start();

    List<int> bubbleSortList = bubbleSort(list);

    stopwatch.stop();

    _printResultTime('bubbleSort', stopwatch.elapsedMicroseconds);

    stopwatch.reset();

    return bubbleSortList;
  }

  static List<int> bubbleSortingOptimized(List<int> sortList) {
    List<int> list = [...sortList];
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

    Stopwatch stopwatch = Stopwatch();

    stopwatch.start();

    List<int> bubbleSortOptimizedList = bubbleSortOptimized(list);

    stopwatch.stop();

    _printResultTime('bubbleSortOptimized', stopwatch.elapsedMicroseconds);

    stopwatch.reset();

    return bubbleSortOptimizedList;
  }

  static List<int> selectionSorting(List<int> sortList) {
    List<int> list = [...sortList];
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

    Stopwatch stopwatch = Stopwatch();

    stopwatch.start();

    List<int> selectionSortList = selectionSort(list);

    stopwatch.stop();

    _printResultTime('selectionSort', stopwatch.elapsedMicroseconds);

    stopwatch.reset();

    return selectionSortList;
  }

  static List<int> insertionSorting(List<int> sortList) {
    List<int> list = [...sortList];

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

    Stopwatch stopwatch = Stopwatch();

    stopwatch.start();
    List<int> insertionSortList = insertionSort(list);
    stopwatch.stop();

    _printResultTime('insertionSort', stopwatch.elapsedMicroseconds);

    stopwatch.reset();

    return insertionSortList;
  }

  static void _printResultTime(String sortingName, int sortingTime) {
    print(
        '\n\x1B[31m$sortingName\x1B[0m - время сортировки: \x1B[31m$sortingTime мкс.\x1B[0m');
  }

  //! _getResult
  // ignore: unused_element
  static void _getSortingResult(
      String sortingName, void Function() funcSorting) {
    Stopwatch stopwatch = Stopwatch();

    stopwatch.start();

    funcSorting();

    stopwatch.stop();

    // _printResultTime(sortingName, stopwatch.elapsedMicroseconds);
    print(
        '\n\x1B[31m$sortingName\x1B[0m - время сортировки: \x1B[31m${stopwatch.elapsedMicroseconds} мкс.\x1B[0m');

    stopwatch.reset();
  }
}
