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

  ToyWithSound car2 = ToyWithSound(car1);
  print(car2);

  ToyWithLight car3 = ToyWithLight(car2);
  print(car3);

  ToyWithRadioControl car4 = ToyWithRadioControl(car3);
  print(car4);
  //
  ToyWithRadioControl car5 = ToyWithRadioControl(car1);
  print(car5);

  ToyWithRadioControl superCar = ToyWithRadioControl(
    ToyWithLight(
      ToyWithSound(car1),
    ),
  );
  print(superCar);
}
