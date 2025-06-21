import 'color_printing_in_console.dart';
import 'linked_list.dart';

// bool show = true; //?
bool show = false; //?

Stopwatch stopwatch = Stopwatch();

Node<E>? getMiddle<E>(LinkedList<E> list) {
  var slow = list.head;
  var fast = list.head;

  while (fast?.next != null) {
    fast = fast?.next?.next;
    slow = slow?.next;
  }

  return slow;
}

// 1 - добавление элемента в конец списка
void addToEndLinkedList(LinkedList<int> linkedList, int number) {
  stopwatch.start();

  linkedList.append(number);

  stopwatch.stop();

  printGreen(
      'LinkedList - добавление элемента в конец списка.\tВремя: ${stopwatch.elapsedMicroseconds} мкс.');

  stopwatch.reset();

  show ? printWhite(' $linkedList') : null;
}

// 2 - добавление элемента в середину списка
void addToMiddleLinkedList(LinkedList<int> linkedList, int number) {
  Node<int> middleNode = getMiddle(linkedList)!;

  stopwatch.start();

  linkedList.insertAfter(middleNode, 888);

  stopwatch.stop();

  printGreen(
      'LinkedList - добавление элемента в середину списка.\tВремя: ${stopwatch.elapsedMicroseconds} мкс.');

  stopwatch.reset();

  show ? printWhite(' $linkedList') : null;
}

// 3 - получение элемента из конца списка
void getEndElementLinkedList(LinkedList<int> linkedList) {
  int endElement;

  stopwatch.start();

  endElement = linkedList.last;

  stopwatch.stop();

  printGreen(
      'LinkedList - получение элемента из конца списка.\tВремя: ${stopwatch.elapsedMicroseconds} мкс.\t\tendElement: $endElement');

  stopwatch.reset();

  show ? printWhite(' $linkedList') : null;
}

// 4 - получение элемента из середины списка
void getMiddleElementLinkedList(LinkedList<int> linkedList) {
  int? middleElement;

  stopwatch.start();

  middleElement = getMiddle(linkedList)?.value;

  stopwatch.stop();

  printGreen(
      'LinkedList - получение элемента из середины списка.\tВремя: ${stopwatch.elapsedMicroseconds} мкс.\t\tmiddleElement: $middleElement');

  stopwatch.reset();

  show ? printWhite(' $linkedList') : null;
}

// 5 - удаление элемента из конца списка
void removeEndElementLinkedList(LinkedList<int> linkedList) {
  stopwatch.start();

  linkedList.removeLast();

  stopwatch.stop();

  printGreen(
      'LinkedList - удаление элемента из конца списка.\t\tВремя: ${stopwatch.elapsedMicroseconds} мкс.');

  stopwatch.reset();

  show ? printWhite(' $linkedList') : null;
}

// 6 - даление элемента из середины списка
void removeMiddleElementLinkedList(LinkedList<int> linkedList) {
  Node<int> middleNode = getMiddle(linkedList)!;

  stopwatch.start();

  linkedList.removeAfter(middleNode);

  stopwatch.stop();

  printGreen(
      'LinkedList - удаление элемента из середины списка.\tВремя: ${stopwatch.elapsedMicroseconds} мкс.');

  stopwatch.reset();

  show ? printWhite(' $linkedList') : null;
}
