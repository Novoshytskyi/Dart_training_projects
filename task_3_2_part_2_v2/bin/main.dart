//           A
//      ┌────┴────┐
//      B         C
//    ┌─┴─┐     ┌─┴─┐
//    D   E     F   G

import 'binary_node.dart';
import 'functions.dart';

void main(List<String> arguments) {
  BinaryNode<String> tree = createBinaryTree();
  print(tree);

  printEachLevel(tree);

  inOrderTraversal(tree);
  preOrderTraversal(tree);
  postOrderTraversal(tree);
}

BinaryNode<String> createBinaryTree() {
  BinaryNode<String> a = BinaryNode('A');

  BinaryNode<String> b = BinaryNode('B');
  BinaryNode<String> c = BinaryNode('C');

  a.leftChild = b;
  a.rightChild = c;

  BinaryNode<String> d = BinaryNode('D');
  BinaryNode<String> e = BinaryNode('E');
  BinaryNode<String> f = BinaryNode('F');
  BinaryNode<String> g = BinaryNode('G');

  b.leftChild = d;
  b.rightChild = e;
  c.leftChild = f;
  c.rightChild = g;

  //?------------------------------------
  // BinaryNode<String> h = BinaryNode('H');
  // BinaryNode<String> i = BinaryNode('I');

  // d.leftChild = h;
  // d.rightChild = i;

  // BinaryNode<String> j = BinaryNode('J');
  // BinaryNode<String> k = BinaryNode('K');

  // f.leftChild = j;
  // f.rightChild = k;

  // BinaryNode<String> l = BinaryNode('L');

  // g.leftChild = l;
  //?------------------------------------

  return a;
}
