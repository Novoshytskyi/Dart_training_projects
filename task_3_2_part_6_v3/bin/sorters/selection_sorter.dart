import 'sorter_template.dart';

class SelectionSorter {
  static List<int> getSortedList(List<int> sortList) {
    // List<int> list = [...sortList];
    List<int> selectionSortList = [];

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

    String comment = SorterTemplate.getComment(
        bestTC: 'O(n\u00B2)',
        worstTC: 'O(n\u00B2)',
        averageTC: 'O(n\u00B2)',
        spaceComplexity: 'O(1)',
        stability: 'Нет');

    SorterTemplate.getSortingResult('Сортировка выбором', comment, () {
      selectionSortList = selectionSort([...sortList]);
    });

    return selectionSortList;
  }
}
