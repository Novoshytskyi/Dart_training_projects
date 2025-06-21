import 'color_printing_in_console.dart';

// bool show = true; //?
bool show = false; //?

Stopwatch stopwatch = Stopwatch();

// 1 - добавление элемента в конец списка
void addToEndList(List<int> list, int number) {
  List<int> list0 = [...list];

  stopwatch.start();

  list0.add(number);

  stopwatch.stop();

  print(
      '\nList\t   - добавление элемента в конец списка.\tВремя: ${stopwatch.elapsedMicroseconds} мкс.');

  stopwatch.reset();

  show ? printWhite(list0.toString()) : null;
}

// 2 - добавление элемента в середину списка
void addToMiddleList(List<int> list, int number) {
  List<int> list0 = [...list];

  int middleIndex = list0.length ~/ 2 + 1;
  stopwatch.start();

  list0.insert(middleIndex, number);

  stopwatch.stop();

  print(
      '\nList\t   - добавление элемента в середину списка.\tВремя: ${stopwatch.elapsedMicroseconds} мкс.');

  stopwatch.reset();

  show ? printWhite(list0.toString()) : null;
}

// 3 - получение элемента из конца списка
void getEndElementList(List<int> list) {
  List<int> list0 = [...list];
  int endElement;

  stopwatch.start();

  endElement = list0.last;

  stopwatch.stop();

  print(
      '\nList\t   - получение элемента из конца списка.\tВремя: ${stopwatch.elapsedMicroseconds} мкс.\t\tendElement: $endElement');

  stopwatch.reset();

  show ? printWhite(list0.toString()) : null;
}

// 4 - получение элемента из середины списка
void getMiddleElementList(List<int> list) {
  List<int> list0 = [...list];

  int middleIndex = list0.length ~/ 2;
  int middleElement;

  stopwatch.start();

  middleElement = list0[middleIndex];

  stopwatch.stop();

  print(
      '\nList\t   - получение элемента из середины списка.\tВремя: ${stopwatch.elapsedMicroseconds} мкс.\t\tmiddleElement: $middleElement');

  stopwatch.reset();

  show ? printWhite(list0.toString()) : null;
}

// 5 - удаление элемента из конца списка
void removeEndElementList(List<int> list) {
  List<int> list0 = [...list];

  stopwatch.start();

  list0.removeLast();

  stopwatch.stop();

  print(
      '\nList\t   - удаление элемента из конца списка.\t\tВремя: ${stopwatch.elapsedMicroseconds} мкс.');

  stopwatch.reset();

  show ? printWhite(list0.toString()) : null;
}

// 6 - удаление элемента из середины списка
void removeMiddleElementList(List<int> list) {
  List<int> list0 = [...list];

  int middleIndex = list0.length ~/ 2 + 1;

  stopwatch.start();

  list0.removeAt(middleIndex);

  stopwatch.stop();

  print(
      '\nList\t   - удаление элемента из середины списка.\tВремя: ${stopwatch.elapsedMicroseconds} мкс.');

  stopwatch.reset();

  show ? printWhite(list0.toString()) : null;
}
