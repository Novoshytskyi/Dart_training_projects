import 'sorter_template.dart';

class QuickSorter {
  static List<int> getSortedList(List<int> sortList) {
    List<int> quickSortList = [];

    // метод нахождения позиции раздела
    int partition(List<int> list, int low, int high) {
      // выберите самый правый элемент в качестве опорного
      int pivot = list[high];

      // указатель на больший элемент
      int i = low - 1;

      // проходим по всем элементам, сравниваем каждый элемент
      // с опорным элементом
      for (int j = low; j < high; j++) {
        if (list[j] <= pivot) {
          // если найден элемент, меньший, чем элемент pivot, поменять
          // его местами с большим элементом, на который указывает i
          i++;

          // замена элемента в i на элемент в j
          int temp = list[i];
          list[i] = list[j];
          list[j] = temp;
        }
      }

      // поменять местами опорный элемент с большим элементом, указанным i
      int temp = list[i + 1];
      list[i + 1] = list[high];
      list[high] = temp;

      // вернуть позицию, с которой выполнено разделение
      return i + 1;
    }

    // void quickSort(List<int> list, int low, int high) {
    void quickSortInternal(List<int> list, int low, int high) {
      if (low < high) {
        // найти элемент pivot таким образом, чтобы элементы,
        // меньшие элемента pivot, находились слева, а элементы,
        // большие элемента pivot, находились справа
        int pi = partition(list, low, high);

        // рекурсивный вызов слева от опорной точки
        quickSortInternal(list, low, pi - 1);

        // рекурсивный вызов справа от опорной точки
        quickSortInternal(list, pi + 1, high);
      }
    }

    List<int> quickSort(List<int> list) {
      quickSortInternal(list, 0, list.length - 1);
      return list;
    }

    String comment = SorterTemplate.getComment(
        bestTC: 'O(n log n)',
        worstTC: 'O(n\u00B2)',
        averageTC: 'O(n log n)',
        spaceComplexity: 'O(log n)',
        stability: 'Нет');

    SorterTemplate.getSortingResult('Быстрая сортировка', comment, () {
      quickSortList = quickSort([...sortList]);
    });

    return quickSortList;
  }
}
