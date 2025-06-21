// import 'dart:io';

// class Car {
//   final String carNumber;

//   Car({required this.carNumber});
//   @override
//   String toString() => carNumber;
// }

// void showCarNumbersInfo(Map<Car, String> cars) {
//   print('\n\tНомера автомобилей:');
//   for (final car in cars.entries) {
//     print('№: ${car.key}');
//   }
// }

// void showCarOwnersInfo(Map<Car, String> cars) {
//   Set<String> ownersSet = {};

//   for (final car in cars.entries) {
//     ownersSet.add(car.value);
//   }
//   print('\n\tВладельцы автомобилей:');
//   for (final owner in ownersSet) {
//     print(owner);
//   }
// }

// void showFullInfo(Map<Car, String> cars) {
//   print('\n\tНомера и владельцы автомобилей:');
//   for (final car in cars.entries) {
//     print('№: ${car.key} - ${car.value}');
//   }
// }

// bool numberContains(Map<Car, String> cars, String searchedNumber) {
//   List<String> list = [];
//   for (final car in cars.entries) {
//     list.add(car.key.carNumber);
//   }

//   return list.contains(searchedNumber) ? true : false;
// }

// void main(List<String> args) {
//   final Map<Car, String> carMap = {}; //number, owner
//   String? incomingParameter1;
//   String? incomingParameter2;

//   do {
//     stdout.write('\nГос. номер автомобиля  или  команда: ');
//     incomingParameter1 = stdin.readLineSync().toString().trim();

//     switch (incomingParameter1) {
//       case 'stop':
//         {
//           return;
//         }
//       case 'list':
//         {
//           showFullInfo(carMap);
//           break;
//         }
//       case 'cars':
//         {
//           showCarNumbersInfo(carMap);
//           break;
//         }
//       case 'owners':
//         {
//           showCarOwnersInfo(carMap);
//           break;
//         }
//       default:
//         {
//           Car? keyForRemove;

//           if (numberContains(carMap, incomingParameter1)) {
//             print('\t\tНомер уже в базе.');
//             for (final i in carMap.entries) {
//               if (i.key.carNumber == incomingParameter1) {
//                 keyForRemove = i.key;
//               }
//             }
//             carMap.remove(keyForRemove);
//           }

//           stdout.write(keyForRemove == null
//               ? '\t\tВладелец автомобиля: '
//               : '\t\tНовый владелец авто: ');

//           incomingParameter2 = stdin.readLineSync().toString();

//           if (incomingParameter1.isNotEmpty && incomingParameter2.isNotEmpty) {
//             carMap.addAll(
//                 {Car(carNumber: incomingParameter1): incomingParameter2});
//           }
//         }
//     }
//   } while (true);
// }

//=============================================================================

import 'dart:io';

void showCarNumbersInfo(Map<String, String> cars) {
  print('\n\tНомера автомобилей:');
  for (final car in cars.entries) {
    print('№: ${car.key}');
  }
}

void showCarOwnersInfo(Map<String, String> cars) {
  Set<String> ownersSet = {};

  for (final car in cars.entries) {
    ownersSet.add(car.value);
  }

  print('\n\tВладельцы автомобилей:');
  for (final owner in ownersSet) {
    print(owner);
  }
}

void showFullInfo(Map<String, String> cars) {
  print('\n\tНомера и владельцы автомобилей:');
  for (final car in cars.entries) {
    print('№: ${car.key} - ${car.value}');
  }
}

void main(List<String> args) {
  final Map<String, String> carMap = {}; //number, owner
  String? incomingParameter1;
  String? incomingParameter2;

  do {
    stdout.write('\nГос. номер автомобиля  или  команда: ');
    incomingParameter1 = stdin.readLineSync().toString().trim();

    switch (incomingParameter1) {
      case 'stop':
        {
          return;
        }
      case 'list':
        {
          showFullInfo(carMap);
          break;
        }
      case 'cars':
        {
          showCarNumbersInfo(carMap);
          break;
        }
      case 'owners':
        {
          showCarOwnersInfo(carMap);
          break;
        }
      default:
        {
          String? keyForRemove;

          if (carMap.containsKey(incomingParameter1)) {
            keyForRemove = incomingParameter1;
            print('\t\tНомер уже в базе.');
          }

          stdout.write(keyForRemove == null
              ? '\t\tВладелец автомобиля: '
              : '\t\tНовый владелец авто: ');

          incomingParameter2 = stdin.readLineSync().toString();

          if (incomingParameter1.isNotEmpty && incomingParameter2.isNotEmpty) {
            carMap.addAll({incomingParameter1: incomingParameter2});
          }
        }
    }
  } while (true);
}
