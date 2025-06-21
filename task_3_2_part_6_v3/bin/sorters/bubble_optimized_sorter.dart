import 'sorter_template.dart';

class BubbleOptimizedSorter {
  static List<int> getSortedList(List<int> sortList) {
    // List<int> list = [...sortList];
    List<int> bubbleSortOptimizedList = [];

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

    String comment = SorterTemplate.getComment(
        bestTC: 'O(n)',
        worstTC: 'O(n\u00B2)',
        averageTC: 'O(n\u00B2)',
        spaceComplexity: 'O(1)',
        stability: 'Да');

    SorterTemplate.getSortingResult('Пузырьковая сортировка оптимиз.', comment,
        () {
      bubbleSortOptimizedList = bubbleSortOptimized([...sortList]);
    });

    return bubbleSortOptimizedList;
  }
}
