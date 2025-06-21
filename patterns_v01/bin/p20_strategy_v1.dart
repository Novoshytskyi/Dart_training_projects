import 'dart:math';

abstract class Strategy {
  void setArgument(List<int> list);
  void executeAlgorithm();
  void printResult();
}

class Multiply2Strategy implements Strategy {
  late List<int> _argument;
  final List<int> _result = [];

  @override
  void setArgument(List<int> list) => _argument = list;

  @override
  void executeAlgorithm() {
    _result.clear();
    for (int i = 0; i < _argument.length; i++) {
      _result.add(_argument[i] * 2);
    }
  }

  @override
  void printResult() {
    print('Результат умножения каждого элемента на 2: $_result');
  }
}

class Power2Strategy implements Strategy {
  late List<int> _argument;
  final List<int> _result = [];

  @override
  void setArgument(List<int> list) => _argument = list;

  @override
  void executeAlgorithm() {
    _result.clear();
    for (int i = 0; i < _argument.length; i++) {
      _result.add(pow(_argument[i], 2).toInt());
    }
  }

  @override
  void printResult() {
    print('Результат возведения каждого элемента в 2-ю степень: $_result');
  }
}

class Power3Strategy implements Strategy {
  late List<int> _argument;
  final List<int> _result = [];

  @override
  void setArgument(List<int> list) => _argument = list;

  @override
  void executeAlgorithm() {
    _result.clear();
    for (int i = 0; i < _argument.length; i++) {
      _result.add(pow(_argument[i], 3).toInt());
    }
  }

  @override
  void printResult() {
    print('Результат возведения каждого элемента в 3-ю степень: $_result');
  }
}

class Context {
  late Strategy _strategy;

  List<int> _data = [];

  void setData(List<int> data) {
    _data = data;
    print('Исходные данные: $data');
  }

  void setStrategy(Strategy strategy) => _strategy = strategy;

  void getResult() {
    _strategy.setArgument(_data);
    _strategy.executeAlgorithm();
    _strategy.printResult();
  }
}

void main(List<String> args) {
  List<int> data1 = [1, 2, 3];
  List<int> data2 = [10, 20, 30];

  Strategy multiply2strategy = Multiply2Strategy();
  Strategy power2strategy = Power2Strategy();
  Strategy power3strategy = Power3Strategy();

  Context context = Context();
  context.setData(data1);

  context.setStrategy(multiply2strategy);
  context.getResult();

  context.setStrategy(power2strategy);
  context.getResult();

  context.setStrategy(power3strategy);
  context.getResult();

  print('-' * 72);

  context.setData(data2);

  context.setStrategy(multiply2strategy);
  context.getResult();

  context.setStrategy(power2strategy);
  context.getResult();

  context.setStrategy(power3strategy);
  context.getResult();
}
