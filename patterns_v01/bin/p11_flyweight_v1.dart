class CadModel3D {
  final String name3D;

  CadModel3D({required this.name3D});
}

class TransportType {
  final String name;
  final CadModel3D model3D;

  TransportType({required this.model3D}) : name = model3D.name3D;

  @override
  String toString() => name;
}

class TransportTypeFactory {
  List<TransportType> transportTypes = [];
  String transportTypeName = '';

  TransportType defaultTransportType = TransportType(
    model3D: CadModel3D(
      name3D: 'велосипед',
    ),
  );

  void addTransportType({required TransportType newTransportType}) =>
      transportTypes.add(newTransportType);

  TransportType getTransportType({required String transportTypeName}) {
    this.transportTypeName = transportTypeName;
    for (TransportType type in transportTypes) {
      if (type.name == transportTypeName) {
        // print('Тип транспорта "$transportTypeName" найден.'); //!
        return type;
      } else {}
    }
    print('''
    Запрашиваемый вид транспорта - "$transportTypeName" не найден. 
    Представлен вид транспорта по умолчанию - "${defaultTransportType.name}".
    '''); //? Удалить!
    return defaultTransportType; //? Удалить!
  } //! добавить Создание нового типа!!!

  @override
  String toString() => transportTypeName;
}

class Transport {
  final TransportType transportType;
  final int positionX;
  final int positionY;

  Transport({
    required this.transportType,
    required this.positionX,
    required this.positionY,
  });

  @override
  String toString() =>
      'Тип: ${transportType.name},\tположение: X = $positionX, Y = $positionY.';
}

class TrafficRulesSimulator {
  final List<Transport> transports = [];

  void addTransport(Transport newTransport) => transports.add(newTransport);

  void showAllTransport() {
    print('\tВесь транспорт в симуляторе:');
    for (Transport transport in transports) {
      print(transport);
    }
  }
}

void main(List<String> args) {
  CadModel3D truck3D = CadModel3D(name3D: 'грузовик');
  CadModel3D passengerCar3D = CadModel3D(name3D: 'легковой');

  TransportType truck = TransportType(model3D: truck3D);
  TransportType passengerCar = TransportType(model3D: passengerCar3D);
  TransportType trolleybus =
      TransportType(model3D: CadModel3D(name3D: 'тролейбус'));

  TransportTypeFactory transportTypeFactory = TransportTypeFactory();
  transportTypeFactory.addTransportType(newTransportType: truck);
  transportTypeFactory.addTransportType(newTransportType: passengerCar);
  transportTypeFactory.addTransportType(newTransportType: trolleybus);

  TransportType transportType1 = transportTypeFactory.getTransportType(
    transportTypeName: 'тролейбус',
  );

  TransportType transportType2 = transportTypeFactory.getTransportType(
    transportTypeName: 'грузовик',
  );

  TransportType transportType3 = transportTypeFactory.getTransportType(
    transportTypeName: 'легковой',
  );

  TrafficRulesSimulator trafficRulesSimulator = TrafficRulesSimulator();

  Transport t1 = Transport(
    transportType: transportType1,
    positionX: 25,
    positionY: 55,
  );

  Transport t2 = Transport(
    transportType: transportType2,
    positionX: 35,
    positionY: 45,
  );

  Transport t3 = Transport(
    transportType: transportType2,
    positionX: 50,
    positionY: 50,
  );

  Transport t4 = Transport(
    transportType: transportType1,
    positionX: 80,
    positionY: 20,
  );
  Transport t5 = Transport(
    transportType: transportType1,
    positionX: 15,
    positionY: 75,
  );
  Transport t6 = Transport(
    transportType: transportType3,
    positionX: 10,
    positionY: 20,
  );

  trafficRulesSimulator.addTransport(t1);
  trafficRulesSimulator.addTransport(t2);
  trafficRulesSimulator.addTransport(t3);
  trafficRulesSimulator.addTransport(t4);
  trafficRulesSimulator.addTransport(t5);
  trafficRulesSimulator.addTransport(t6);

  TransportType transportType555 = transportTypeFactory.getTransportType(
    transportTypeName: 'мопед',
  );
  Transport t555 = Transport(
    transportType: transportType555,
    positionX: 555,
    positionY: 555,
  );
  trafficRulesSimulator.addTransport(t555);

  trafficRulesSimulator.showAllTransport();
}
