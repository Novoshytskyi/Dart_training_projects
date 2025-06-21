enum Tuning {
  small,
  middle,
  full,
}

class Facade {
  final Toy toy;
  final Tuning tuning;
  late AdditionalOptions _toyWithTuning;

  Facade({
    required this.toy,
    required this.tuning,
  });

  void _makeTuning() {
    switch (tuning) {
      case Tuning.small:
        _toyWithTuning = ToyWithLight(toy);

      case Tuning.middle:
        _toyWithTuning = ToyWithSound(
          ToyWithLight(toy),
        );

      case Tuning.full:
        _toyWithTuning = ToyWithRadioControl(
          ToyWithSound(
            ToyWithLight(toy),
          ),
        );
    }
  }

  void show() {
    _makeTuning();
    print(_toyWithTuning);
  }
}

abstract class AbstractToy {
  String name();
  double price();
}

class Toy implements AbstractToy {
  final String _name;
  final double _price;

  Toy(this._name, this._price);

  @override
  String name() => _name;

  @override
  double price() => _price;

  @override
  String toString() => '$_name. \tЦена: $_price грн.';
}

abstract class AdditionalOptions implements AbstractToy {
  final AbstractToy abstractToy;

  AdditionalOptions(this.abstractToy);

  String optionName();
  double optionPrice();

  @override
  String name() => '${abstractToy.name()} + ${optionName()}';

  @override
  double price() => abstractToy.price() + optionPrice();

  @override
  String toString() => '${name()}.\tЦена: ${price()} грн.';
}

class ToyWithSound extends AdditionalOptions {
  final String _optionName = 'Звуковой сигнал';
  final double _optionPrice = 30.0;

  ToyWithSound(super.abstractToy);

  @override
  String optionName() => _optionName;

  @override
  double optionPrice() => _optionPrice;
}

class ToyWithLight extends AdditionalOptions {
  final String _optionName = 'Светящиеся элементы';
  final double _optionPrice = 20.0;

  ToyWithLight(super.abstractToy);

  @override
  String optionName() => _optionName;

  @override
  double optionPrice() => _optionPrice;
}

class ToyWithRadioControl extends AdditionalOptions {
  final String _optionName = 'Радиоуправление';
  final double _optionPrice = 100.0;

  ToyWithRadioControl(super.abstractToy);

  @override
  String optionName() => _optionName;

  @override
  double optionPrice() => _optionPrice;
}

void main(List<String> args) {
  Toy car1 = Toy('Машинка', 50.0);
  print(car1);

  Facade facade1 = Facade(toy: car1, tuning: Tuning.small);
  facade1.show();

  Facade(toy: car1, tuning: Tuning.full).show();
}
