abstract class TrafficLightState {
  String getColor();
  void next(TrafficLight light);
}

class GreenState implements TrafficLightState {
  final String _colorName = 'Зеленый';

  @override
  String getColor() {
    print('\x1B[32m$_colorName\x1B[0m');
    return _colorName;
  }

  @override
  void next(TrafficLight light) {
    light.currentState = YellowState();
  }
}

class YellowState implements TrafficLightState {
  final String _colorName = 'Желтый';

  @override
  String getColor() {
    print('\x1B[33m$_colorName\x1B[0m');
    return _colorName;
  }

  @override
  void next(TrafficLight light) {
    light.currentState = RedState();
  }
}

class RedState implements TrafficLightState {
  final String _colorName = 'Красный';

  @override
  String getColor() {
    print('\x1B[31m$_colorName\x1B[0m');
    return _colorName;
  }

  @override
  void next(TrafficLight light) {
    light.currentState = GreenState();
  }
}

class TrafficLight {
  TrafficLightState currentState;

  TrafficLight(this.currentState);

  void next() {
    getCurrentColor();
    currentState.next(this);
  }

  void getCurrentColor() => currentState.getColor();
}

void main(List<String> args) {
  TrafficLight trafficLight = TrafficLight(GreenState());
  trafficLight.next();
  trafficLight.next();
  trafficLight.next();
  print('');
  trafficLight.next();
  trafficLight.next();
  trafficLight.next();
  trafficLight.next();
}
