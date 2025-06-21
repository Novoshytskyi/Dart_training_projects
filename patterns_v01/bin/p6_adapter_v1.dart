class Rectangle {
  final double height;
  final double width;

  Rectangle({
    required this.height,
    required this.width,
  });

  @override
  String toString() => 'Прямоугольник. Высота: $height",  ширина: $width"';
}

abstract class MetricDimension {
  double getSizeY();
  double getSizeX();
}

class Adapter extends MetricDimension {
  final Rectangle rectangleSize;

  Adapter({required this.rectangleSize});

  @override
  String toString() => 'H = ${getSizeY()} мм, W = ${getSizeX()} мм';

  @override
  double getSizeY() => rectangleSize.height * 25.4;

  @override
  double getSizeX() => rectangleSize.width * 25.4;
}

void main(List<String> args) {
  Rectangle rectangle = Rectangle(height: 10.0, width: 20.0);
  print(rectangle);

  // Adapter adapter = Adapter(rectangleSize: rectangle);
  // print(adapter.getSizeY());
  // print(adapter.getSizeX());
  // print(adapter);

  MetricDimension dimension = Adapter(rectangleSize: rectangle);
  print(dimension.getSizeY());
  print(dimension.getSizeX());
  print(dimension);
}
