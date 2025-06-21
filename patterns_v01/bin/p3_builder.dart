abstract class GuiBuilder {
  void buildPart1();
  void buildPart2();
  void buildPart3();
  UI getUi();
}

class AndroidUiBuilder extends GuiBuilder {
  final AndroidUi _androidUi = AndroidUi();

  @override
  void buildPart1() {
    _androidUi.adding('CheckBox');
  }

  @override
  void buildPart2() {
    _androidUi.adding('DropdownMenu');
  }

  @override
  void buildPart3() {
    _androidUi.adding('Button');
  }

  @override
  AndroidUi getUi() {
    return _androidUi;
  }
}

class IosUiBuilder extends GuiBuilder {
  final IosUi _iosUi = IosUi();

  @override
  void buildPart1() {
    _iosUi.adding('CheckBox');
  }

  @override
  void buildPart2() {
    _iosUi.adding('CupertinoPicker');
  }

  @override
  void buildPart3() {
    _iosUi.adding('Button');
  }

  @override
  IosUi getUi() {
    return _iosUi;
  }
}

abstract class UI {
  void adding(String part);
  void show();
}

class IosUi extends UI {
  final List<String> _partsOfUi = [];

  @override
  void adding(String part) {
    _partsOfUi.add(part);
  }

  @override
  void show() {
    print('\tIos Ui:');
    for (var element in _partsOfUi) {
      print(element);
    }
  }
}

class AndroidUi extends UI {
  final List<String> _partsOfUi = [];

  @override
  void adding(String part) {
    _partsOfUi.add(part);
  }

  @override
  void show() {
    print('\tAndroid Ui:');
    for (var element in _partsOfUi) {
      print(element);
    }
  }
}

class Director {
  final GuiBuilder builder;

  Director(this.builder);

  void construct() {
    builder.buildPart1();
    builder.buildPart2();
    builder.buildPart3();
  }
}

void main(List<String> args) {
  AndroidUiBuilder androidUiBuilder = AndroidUiBuilder();

  Director director1 = Director(androidUiBuilder);

  director1.construct();

  AndroidUi androidUi = androidUiBuilder.getUi();

  androidUi.show();
  //

  IosUiBuilder iosUiBuilder = IosUiBuilder();
  Director director2 = Director(iosUiBuilder);
  director2.construct();
  IosUi iosUi = iosUiBuilder.getUi();
  iosUi.show();
}
