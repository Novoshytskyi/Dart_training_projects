import 'sorter_template.dart';

class MergeSorter {
  static List<int> getSortedList(List<int> sortList) {
    List<int> mergeSortList = [];

    // Объединить два подмассива L и M в list
    void merge(List<int> list, int p, int q, int r) {
      int n1 = q - p + 1;
      int n2 = r - q;

      List<int> L = List<int>.filled(n1, 0);
      List<int> M = List<int>.filled(n2, 0);

      for (int i = 0; i < n1; i++) {
        L[i] = list[p + i];
      }
      for (int j = 0; j < n2; j++) {
        M[j] = list[q + 1 + j];
      }

      // Поддерживать текущий индекс подмассивов и основного массива
      int i = 0, j = 0, k = p;

      // Пока достигнем конца L или M, выбираем больший из
      // элементов L и M и размещаем их в правильном положении в list[p..r]
      while (i < n1 && j < n2) {
        if (L[i] <= M[j]) {
          list[k] = L[i];
          i++;
        } else {
          list[k] = M[j];
          j++;
        }
        k++;
      }

      // Когда заканчиваются элементы в L или M,
      // берем оставшиеся элементы и помещаем в list[p..r]
      while (i < n1) {
        list[k] = L[i];
        i++;
        k++;
      }

      while (j < n2) {
        list[k] = M[j];
        j++;
        k++;
      }
    }

    // Разделить массив на два подмассива, отсортировать их и объединить
    void mergeSortInternal(List<int> list, int l, int r) {
      if (l < r) {
        // m - точка, в которой массив делится на два подмассива
        int m = (l + r) ~/ 2;

        mergeSortInternal(list, l, m);
        mergeSortInternal(list, m + 1, r);

        // Объединить отсортированные подмассивы
        merge(list, l, m, r);
      }
    }

    List<int> mergeSort(List<int> list) {
      mergeSortInternal(list, 0, list.length - 1);
      return list;
    }

    String comment = SorterTemplate.getComment(
        bestTC: 'O(n log n)',
        worstTC: 'O(n log n)',
        averageTC: 'O(n log n)',
        spaceComplexity: 'O(n)',
        stability: 'Да');

    SorterTemplate.getSortingResult('Сортировка слиянием', comment, () {
      mergeSortList = mergeSort([...sortList]);
    });

    return mergeSortList;
  }
}
