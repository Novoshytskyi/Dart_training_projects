abstract class TypeOfSystem {
  DisplayStyle displayStyle();
  void show();
}

class IosUi implements TypeOfSystem {
  final DisplayStyle _displayStyle;

  IosUi(this._displayStyle);

  @override
  void show() {
    print('\tIos Ui:');
    _displayStyle.show();
  }

  @override
  DisplayStyle displayStyle() => _displayStyle;
}

class AndroidUi implements TypeOfSystem {
  final DisplayStyle _displayStyle;

  AndroidUi(this._displayStyle);

  @override
  void show() {
    print('\tAndroid Ui:');
    _displayStyle.show();
  }

  @override
  DisplayStyle displayStyle() => _displayStyle;
}

class WindowsUi extends TypeOfSystem {
  final DisplayStyle _displayStyle;

  WindowsUi(this._displayStyle);

  @override
  void show() {
    print('\tWindows Ui:');
    _displayStyle.show();
  }

  @override
  DisplayStyle displayStyle() => _displayStyle;
}

abstract class DisplayStyle {
  void show();
}

class UserDisplay extends DisplayStyle {
  final List<String> _partsOfUi = [
    'CheckBox',
    'CheckBox',
    'Button',
  ];

  @override
  void show() {
    print('Экран пользователя:');
    for (var element in _partsOfUi) {
      print('   $element');
    }
  }
}

class AdminDisplay extends DisplayStyle {
  final List<String> _partsOfUi = [
    'CheckBox',
    'CheckBox',
    'CheckBox',
    'CheckBox',
    'Button',
    'Button'
  ];

  @override
  void show() {
    print('Экран администратора:');
    for (var element in _partsOfUi) {
      print('   $element');
    }
  }
}

void main(List<String> args) {
  DisplayStyle userDisplay = UserDisplay();
  DisplayStyle adminDisplay = AdminDisplay();

  TypeOfSystem androidUi1 = AndroidUi(userDisplay);
  TypeOfSystem androidUi2 = AndroidUi(adminDisplay);

  androidUi1.show();
  androidUi2.show();

  TypeOfSystem iosUi1 = IosUi(userDisplay);
  TypeOfSystem iosUi2 = IosUi(adminDisplay);

  iosUi1.show();
  iosUi2.show();

  TypeOfSystem windowsUi1 = WindowsUi(userDisplay);
  TypeOfSystem windowsUi2 = WindowsUi(adminDisplay);

  windowsUi1.show();
  windowsUi2.show();
}
