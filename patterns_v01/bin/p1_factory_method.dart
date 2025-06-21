enum Child {
  boy,
  girl,
  everything,
}

enum Size {
  large('большие'),
  medium('среднеразмерные'),
  small('маленькие');

  final String localization;
  const Size(this.localization);

  @override
  String toString() => localization;
}

abstract class Toy {
  Toy(this.size);
  final Size size;
}

class Car extends Toy {
  Car(super.size);
  @override
  String toString() => 'Мальчикам обычно дарят $size машинки.';
}

class Bear extends Toy {
  Bear(super.size);
  @override
  String toString() => 'Любому ребенку всегда нравятся $size медведи.';
}

class Doll extends Toy {
  Doll(super.size);
  @override
  String toString() => 'Девочкам обычно дарят $size куклы.';
}

class ToyFactory {
  static Toy toyFor(Child child) {
    Toy toy;
    switch (child) {
      case Child.boy:
        toy = Car(Size.small);
        break;
      case Child.girl:
        toy = Doll(Size.large);
        break;
      case Child.everything:
        toy = Bear(Size.medium);
        break;
    }

    return toy;
  }
}

void main(List<String> args) {
  Toy present1 = ToyFactory.toyFor(Child.boy);
  Toy present2 = ToyFactory.toyFor(Child.girl);
  Toy present3 = ToyFactory.toyFor(Child.everything);

  print(present1);
  print(present2);
  print(present3);
}
