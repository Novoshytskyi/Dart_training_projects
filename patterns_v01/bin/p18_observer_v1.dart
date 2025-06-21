abstract class Observer {
  void update(String colorName);
}

class Button extends Observer {
  String _colorName;

  Button({String colorName = 'синий'}) : _colorName = colorName;

  @override
  void update(String colorName) => _colorName = colorName;

  @override
  String toString() => 'Кнопка, цвет: $_colorName.';
}

class Checkbox extends Observer {
  String _colorName;

  Checkbox({String colorName = 'синий'}) : _colorName = colorName;

  @override
  void update(String colorName) => _colorName = colorName;

  @override
  String toString() => 'Чекбокс, цвет: $_colorName.';
}

class AlertDialog extends Observer {
  String _colorName;

  AlertDialog({String colorName = 'синий'}) : _colorName = colorName;

  @override
  void update(String colorName) => _colorName = colorName;

  @override
  String toString() => 'Диалог, цвет: $_colorName.';
}

class Subject {
  final List<Observer> _observers = [];

  Subject();

  void addObserver(Observer observer) {
    _observers.add(observer);
    print('\tОбсервер ($observer) добавлен.');
  }

  void deleteObserver(Observer observer) {
    _observers.remove(observer);
    print('\tОбсервер ($observer) удален.');
  }

  void notifyObservers({required String colorName}) {
    for (Observer observer in _observers) {
      observer.update(colorName);
    }
    print('\tОбсерверы уведомлены (изменить цвет на: $colorName).');
  }

  void printAllObservers() {
    print('\tОбсерверы:');

    for (Observer observer in _observers) {
      print(observer);
    }
  }
}

void main(List<String> args) {
  Observer button1 = Button(colorName: 'красный');
  Observer button2 = Button();
  Observer checkbox1 = Checkbox(colorName: 'желтый');
  Observer dialog1 = AlertDialog();

  Subject subject = Subject();

  subject.addObserver(button1);
  subject.addObserver(button2);
  subject.addObserver(checkbox1);
  subject.addObserver(dialog1);

  subject.printAllObservers();

  subject.notifyObservers(colorName: 'зеленый');

  subject.printAllObservers();

  subject.deleteObserver(button1);
  subject.deleteObserver(button2);

  subject.printAllObservers();

  subject.notifyObservers(colorName: 'желтый');
  subject.printAllObservers();
}
