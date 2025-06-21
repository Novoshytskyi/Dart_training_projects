import 'dart:math';

List<int> getRandomListByLenght(String length) {
  List<int> list = [];
  int listLength = 0;
  Random rng = Random();

  listLength = int.parse(length);
  for (int i = 0; i < listLength; i++) {
    list.add(rng.nextInt(1000));
  }

  list.sort();
  return list;
}

bool isNumber(String str) {
  try {
    if (int.parse(str) >= 0) {
      return true;
    } else {
      throw Error();
    }
  } catch (e) {
    print('\n$str - не является числом!\n');

    return false;
  }
}
