class ButtonOriginator {
  late String _colorName;
  late int _height;
  late int _width;

  ButtonOriginator(
    this._colorName,
    this._height,
    this._width,
  );

  set colorName(String colorName) => _colorName = colorName;
  set height(int height) => _height = height;
  set width(int width) => _width = width;

  ButtonMemento saveState() {
    print('Состояние сохранено.');

    return ButtonMemento(_colorName, _height, _width);
  }

  void restoreState(ButtonMemento buttonMemento) {
    _colorName = buttonMemento._colorName;
    _height = buttonMemento._height;
    _width = buttonMemento._width;

    print('Состояние восстановлено.');
  }

  @override
  String toString() {
    return 'colorName: $_colorName, \nheight: $_height, \nwidth: $_width\n';
  }
}

class ButtonMemento {
  final String _colorName;
  final int _height;
  final int _width;

  ButtonMemento(
    this._colorName,
    this._height,
    this._width,
  );
}

class Caretaker {
  late ButtonMemento _buttonMemento;

  set buttonMemento(ButtonMemento buttonMemento) =>
      _buttonMemento = buttonMemento;
  // ignore: unnecessary_getters_setters
  ButtonMemento get buttonMemento => _buttonMemento;
}

void main(List<String> args) {
  ButtonOriginator button1 = ButtonOriginator('красный', 25, 50);
  Caretaker caretaker = Caretaker();

  print(button1);
  caretaker.buttonMemento = button1.saveState();

  button1.colorName = 'зеленый';
  button1.height = 125;
  button1.width = 150;

  print(button1);

  button1.restoreState(caretaker.buttonMemento);
  print(button1);
}
