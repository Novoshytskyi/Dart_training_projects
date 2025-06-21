import 'sorter_template.dart';

class BubbleSorter {
  static List<int> getSortedList(List<int> sortList) {
    List<int> bubbleSortList = [];

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

    String comment = SorterTemplate.getComment(
        bestTC: 'O(n)',
        worstTC: 'O(n\u00B2)',
        averageTC: 'O(n\u00B2)',
        spaceComplexity: 'O(1)',
        stability: 'Да');

    SorterTemplate.getSortingResult('Пузырьковая сортировка', comment, () {
      bubbleSortList = bubbleSort([...sortList]);
    });

    return bubbleSortList;
  }
}
