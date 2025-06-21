abstract class SorterTemplate {
  static String getComment({
    required String bestTC,
    required String worstTC,
    required String averageTC,
    required String spaceComplexity,
    required String stability,
  }) {
    return '''
    Временная сложность (Time Complexity):
    \t\t\tЛучший:\t$bestTC,
    \t\t\tХудший:\t$worstTC,
    \t\t\tСредн.:\t$averageTC.
    Пространственная сложность (Space Complexity): $spaceComplexity.
    Стабильность (Stability): $stability.''';
  }

  static void getSortingResult(
      String sortingName, String comment, void Function() funcSorting) {
    Stopwatch stopwatch = Stopwatch();

    stopwatch.start();

    funcSorting();

    stopwatch.stop();

    print(
        '\n\x1B[31m$sortingName\x1B[0m - время сортировки: \x1B[31m${stopwatch.elapsedMicroseconds} мкс.\x1B[0m');

    print('\x1B[32m$comment\x1B[0m');

    stopwatch.reset();
  }
}
