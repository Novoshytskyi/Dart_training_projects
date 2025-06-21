abstract class Mediator {
  void notify(String sender, String event);
}

class ConcreteMediator implements Mediator {
  late Checkbox _checkbox;
  late Button _button;
  late AlertDialog _alertDialog;

  void setCheckbox(Checkbox checkbox) => _checkbox = checkbox;

  void setButton(Button button) => _button = button;

  void setAlertDialog(AlertDialog alertDialog) => _alertDialog = alertDialog;

  @override
  void notify(String sender, String event) {
    if (sender == 'Checkbox' && event == 'checked') {
      _button.setEnabled();
    } else if (sender == 'Checkbox' && event == 'unchecked') {
      _button.setDisabled();
    } else if (sender == 'Button' && event == 'clicked') {
      _alertDialog.show();
    } else if (sender == 'Dialog' && event == 'closed') {
      _checkbox.reset();
    }
  }
}

class Checkbox {
  final Mediator mediator;
  bool _isChecked = false;

  Checkbox(this.mediator);

  void toggle() {
    _isChecked = !_isChecked;
    if (_isChecked) {
      print('Флажок поставлен.');
      mediator.notify('Checkbox', 'checked');
    } else {
      print('Флажок снят.');
      mediator.notify('Checkbox', 'unchecked');
    }
  }

  //? ???
  void reset() {
    _isChecked = false;
    print('Флажок сброшен');
    mediator.notify('Checkbox', 'unchecked');
  }
}

class Button {
  final Mediator mediator;
  bool _isEnabled = false;

  Button(this.mediator);

  void setEnabled() {
    _isEnabled = true;
    print('Кнопка стала активна.');
  }

  void setDisabled() {
    _isEnabled = false;
    print('Кнопка стала не активна.');
  }

  void click() {
    if (_isEnabled) {
      print('Кнопка нажата');
      mediator.notify('Button', 'clicked');
    }
  }
}

class AlertDialog {
  final Mediator mediator;
  bool _isShown = false;

  AlertDialog(this.mediator);

  void show() {
    if (!_isShown) {
      _isShown = true;
      print('Диалог показан.');
    }
  }

  void close() {
    if (_isShown) {
      _isShown = false;
      print('Диалог закрыт.');
      mediator.notify('Dialog', 'closed');
    }
  }
}

void main() {
  ConcreteMediator mediator = ConcreteMediator();

  Checkbox checkbox = Checkbox(mediator);
  Button button = Button(mediator);
  AlertDialog dialog = AlertDialog(mediator);

  mediator.setCheckbox(checkbox);
  mediator.setButton(button);
  mediator.setAlertDialog(dialog);

  // checkbox.toggle(); //+-

  checkbox.toggle();
  button.click();
  dialog.close();

  // checkbox.toggle(); //+-
  // button.click(); //+-
}
