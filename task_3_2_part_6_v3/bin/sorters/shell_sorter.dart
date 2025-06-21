import 'sorter_template.dart';

class ShellSorter {
  static List<int> getSortedList(List<int> sortList) {
    List<int> shellSortList = [];

    List<int> shellSort(List<int> list) {
      int length = list.length;

      for (int interval = length ~/ 2; interval > 0; interval ~/= 2) {
        for (int i = interval; i < length; i += 1) {
          int temp = list[i];
          int j;
          for (j = i;
              j >= interval && list[j - interval] > temp;
              j -= interval) {
            list[j] = list[j - interval];
          }
          list[j] = temp;
        }
      }
      return list;
    }

    String comment = SorterTemplate.getComment(
        bestTC: 'O(n log n)',
        worstTC: 'O(n\u00B2)',
        averageTC: 'O(n log n)',
        spaceComplexity: 'O(1)',
        stability: 'Нет');

    SorterTemplate.getSortingResult('Сортировка Шелла', comment, () {
      shellSortList = shellSort([...sortList]);
    });

    return shellSortList;
  }
}
