abstract class Shape {
  Shape clone();
}

class Rectangle implements Shape {
  late int height;
  late int width;
  late String colorName;
  bool _isPrototype = true;

  Rectangle(
    this.height,
    this.width,
    this.colorName,
  );

  Rectangle.fromSource(Rectangle source) {
    height = source.height;
    width = source.width;
    colorName = source.colorName;
    _isPrototype = false;
  }

  @override
  Rectangle clone() {
    return Rectangle.fromSource(this);
  }

  @override
  String toString() {
    return 'Прямоугольник. Высота: $height мм, Ширина: $width мм, Цвет: $colorName. ${_isPrototype ? 'Это прототип.' : 'Это клон.'}';
  }
}

class Square implements Shape {
  late int side;
  late String colorName;
  bool _isPrototype = true;

  Square(
    this.side,
    this.colorName,
  );

  Square.fromSource(Square source) {
    side = source.side;
    colorName = source.colorName;
    _isPrototype = false;
  }

  @override
  Square clone() {
    return Square.fromSource(this);
  }

  @override
  String toString() {
    return 'Квадрат. Сторана: $side мм, Цвет: $colorName. ${_isPrototype ? 'Это прототип.' : 'Это клон.'}';
  }
}

class Circle implements Shape {
  late int radius;
  late String colorName;
  bool _isPrototype = true;

  Circle(
    this.radius,
    this.colorName,
  );

  Circle.fromSource(Circle source) {
    radius = source.radius;
    colorName = source.colorName;
    _isPrototype = false;
  }

  @override
  Circle clone() {
    return Circle.fromSource(this);
  }

  @override
  String toString() {
    return 'Круг. Радиус: $radius мм, Цвет: $colorName. ${_isPrototype ? 'Это прототип.' : 'Это клон.'}';
  }
}

void main(List<String> args) {
  Rectangle rectangle1 = Rectangle(20, 40, 'Красный');
  print(rectangle1);

  Rectangle rectangle2 = rectangle1.clone();
  print(rectangle2);

  rectangle2.height = 5;
  rectangle2.width = 10;
  rectangle2.colorName = 'Желтый';
  print(rectangle2);

  Shape rectangle3 = rectangle2.clone();
  (rectangle3 as Rectangle).colorName = 'Зеленый';
  print(rectangle3);

  print('--' * 36);

  Square square1 = Square(25, 'Зеленый');
  print(square1);
  Square square2 = square1.clone();
  square2.colorName = 'Синий';
  print(square2);

  print('--' * 36);

  Circle circle1 = Circle(35, 'Оранжевый');
  print(circle1);
  Circle circle2 = circle1.clone();
  print(circle2);
}
