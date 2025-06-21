import 'sorter_template.dart';

class InsertionSorter {
  static List<int> getSortedList(List<int> sortList) {
    // List<int> list = [...sortList];
    List<int> insertionSortList = [];

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

    String comment = SorterTemplate.getComment(
        bestTC: 'O(n)',
        worstTC: 'O(n\u00B2)',
        averageTC: 'O(n\u00B2)',
        spaceComplexity: 'O(1)',
        stability: 'Да');

    SorterTemplate.getSortingResult('Сортировка вставками', comment, () {
      insertionSortList = insertionSort([...sortList]);
    });

    return insertionSortList;
  }
}
