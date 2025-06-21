import 'binary_node.dart';
import 'queue.dart';

void printEachLevel<T>(BinaryNode<T> tree) {
  print('\nНапечатать каждый уровень - Tree in Level Order');
  final result = StringBuffer();
  // 1
  var queue = QueueStack<BinaryNode<T>>();
  var nodesLeftInCurrentLevel = 0;
  queue.enqueue(tree);
  // 2
  while (!queue.isEmpty) {
    // 3
    nodesLeftInCurrentLevel = queue.length;
    // 4
    while (nodesLeftInCurrentLevel > 0) {
      final node = queue.dequeue();
      if (node == null) break;
      result.write('${node.value} ');

      if (node.leftChild != null) {
        queue.enqueue(node.leftChild!);
      }
      if (node.rightChild != null) {
        queue.enqueue(node.rightChild!);
      }

      nodesLeftInCurrentLevel -= 1;
    }
    // 5
    result.write('\n');
  }

  print(result);
}

void inOrderTraversal(BinaryNode<String> tree) {
  List<String> listNodes = [];
  print('\nОбход по порядку - In-Order Traversal');
  tree.traverseInOrder(
    (value) => listNodes.add(value),
  );
  print(listNodes.join(' → '));
}

void preOrderTraversal(BinaryNode<String> tree) {
  List<String> listNodes = [];

  print('\nПредварительный обход - Pre-Order Traversal');
  tree.traversePreOrder(
    (value) => listNodes.add(value),
  );
  print(listNodes.join(' → '));
}

void postOrderTraversal(BinaryNode<String> tree) {
  List<String> listNodes = [];

  print('\nПост-порядковый обход - Post-Order Traversal');
  tree.traversePostOrder(
    (value) => listNodes.add(value),
  );
  print(listNodes.join(' → '));
}
