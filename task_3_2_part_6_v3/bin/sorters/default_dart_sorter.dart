import 'sorter_template.dart';

class DefaultDartSorter {
  static List<int> getSortedList(List<int> sortList) {
    List<int> list = [...sortList];

    String comment =
        '''    Временная сложность (Time Complexity): O(n log n).''';

    SorterTemplate.getSortingResult('Dart сортировка встроенная', comment, () {
      list.sort();
    });

    return list;
  }
}
