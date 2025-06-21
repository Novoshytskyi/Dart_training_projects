abstract class CheckBox {
  void paint();
}

class AndroidCheckBox extends CheckBox {
  @override
  void paint() {
    print('Android CheckBox');
  }
}

class IOsCheckBox extends CheckBox {
  @override
  void paint() {
    print('IOs CheckBox');
  }
}

abstract class Arrow {
  void paint();
}

class AndroidArrow extends Arrow {
  @override
  void paint() {
    print('Android Arrow');
  }
}

class IOsArrow extends Arrow {
  @override
  void paint() {
    print('IOs Arrow');
  }
}

abstract class Button {
  void paint();
}

class AndroidButton extends Button {
  @override
  void paint() {
    print('Android Button');
  }
}

class IOsButton extends Button {
  @override
  void paint() {
    print('IOs Button');
  }
}

abstract class GUIFactory {
  CheckBox createCheckBox();
  Arrow createArrow();
  Button createButton();
}

class AndroidFactory extends GUIFactory {
  @override
  CheckBox createCheckBox() {
    return AndroidCheckBox();
  }

  @override
  Arrow createArrow() {
    return AndroidArrow();
  }

  @override
  Button createButton() {
    return AndroidButton();
  }
}

class IOsFactory extends GUIFactory {
  @override
  CheckBox createCheckBox() {
    return IOsCheckBox();
  }

  @override
  Arrow createArrow() {
    return IOsArrow();
  }

  @override
  Button createButton() {
    return IOsButton();
  }
}

enum PhoneSystem {
  android,
  ios,
}

void main(List<String> args) {
  PhoneSystem currentSystem = PhoneSystem.android;

  CheckBox checkBox;
  Arrow arrow;
  Button button;

  GUIFactory factory;

  switch (currentSystem) {
    case PhoneSystem.android:
      factory = AndroidFactory();
    case PhoneSystem.ios:
      factory = IOsFactory();
  }

  checkBox = factory.createCheckBox();
  checkBox.paint();

  arrow = factory.createArrow();
  arrow.paint();

  button = factory.createButton();
  button.paint();

  void createUI() {
    factory.createCheckBox().paint();
    factory.createArrow().paint();
    factory.createButton().paint();
  }

  createUI();
}
