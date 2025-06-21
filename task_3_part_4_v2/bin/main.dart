import 'dart:math';

// import 'color_printing_in_console.dart';
import 'linked_list.dart';
import 'linked_list_functions.dart';
import 'list_functions.dart';

void main(List<String> args) {
  List<int> list = [];
  // ignore: unused_local_variable
  LinkedList<int> linkedList = LinkedList<int>();

  var rng = Random();
  int randomValue;
  for (int i = 0; i < 1000000; i++) {
    randomValue = rng.nextInt(100);
    list.add(randomValue);
  }

  LinkedList<int> linkedListFromList(List<int> list) {
    LinkedList<int> linkedList = LinkedList<int>();

    for (int i = 0; i < list.length; i++) {
      linkedList.append(list[i]);
    }
    return linkedList;
  }

  linkedList = linkedListFromList(list);

  // printYellow('$list\n $linkedList');

  // 1 - добавление элемента в конец списка
  addToEndList(list, 888);
  addToEndLinkedList(linkedListFromList(list), 888);

  // 2 - добавление элемента в середину списка
  addToMiddleList(list, 888);
  addToMiddleLinkedList(linkedListFromList(list), 888);

  // 3 - получение элемента из конца списка
  getEndElementList(list);
  getEndElementLinkedList(linkedListFromList(list));

  // 4 - получение элемента из середины списка
  getMiddleElementList(list);
  getMiddleElementLinkedList(linkedListFromList(list));

  // 5 - уудаление элемента из конца списка
  removeEndElementList(list);
  removeEndElementLinkedList(linkedListFromList(list));

  // 6 - удаление элемента из середины списка
  removeMiddleElementList(list);
  removeMiddleElementLinkedList(linkedListFromList(list));

  // printYellow('\n$list\n $linkedList\n');
}
