// import 'dart:io';

// class Car {
//   final String carNumber;

//   Car({required this.carNumber});
//   @override
//   String toString() => carNumber;
// }

// void showCarNumbersList(List<Car> numbersList) {
//   print('\tНомера автомобилей:');
//   for (Car car in numbersList) {
//     print('${numbersList.indexOf(car) + 1}. $car');
//   }
// }

// bool isNumber(String str) {
//   try {
//     if (int.parse(str) > 0) {
//       return true;
//     } else {
//       throw Error();
//     }
//   } catch (e) {
//     print('\t$str - не является номером!');

//     return false;
//   }
// }

// void main(List<String> args) {
//   final List<Car> carNumbersList = [];
//   String? incomingParameter1;
//   String? incomingParameter2;
//   int insertionIndex = 0;

//   do {
//     stdout.write('\nГос. номер автомобиля или команда: ');
//     incomingParameter1 = stdin.readLineSync().toString().trim();

//     if (incomingParameter1.isEmpty) {
//       print('\tВведите номер автомобиля!');
//       continue;
//     }

//     switch (incomingParameter1) {
//       case 'stop':
//         {
//           return;
//         }
//       case 'list':
//         {
//           showCarNumbersList(carNumbersList);
//           break;
//         }
//       default:
//         {
//           stdout.write('\tНомер автомобиля в списке: ');
//           incomingParameter2 = stdin.readLineSync().toString();

//           if (!isNumber(incomingParameter2)) {
//             break;
//           }

//           insertionIndex = int.parse(incomingParameter2) - 1;

//           if (insertionIndex < carNumbersList.length) {
//             carNumbersList.insert(
//                 insertionIndex, Car(carNumber: incomingParameter1));
//           } else {
//             carNumbersList.add(Car(carNumber: incomingParameter1));
//             print('\tДобавлен номер: $incomingParameter1');
//           }
//         }
//     }
//   } while (true);
// }

//=============================================================================

import 'dart:io';

void showCarNumbersList(List<String> numbersList) {
  print('\tНомера автомобилей:');
  for (String car in numbersList) {
    print('${numbersList.indexOf(car) + 1}. $car');
  }
}

bool isNumber(String str) {
  try {
    if (int.parse(str) > 0) {
      return true;
    } else {
      throw Error();
    }
  } catch (e) {
    print('\t$str - не является номером!');

    return false;
  }
}

void main(List<String> args) {
  final List<String> carNumbersList = [];
  String? incomingParameter1;
  String? incomingParameter2;
  int insertionIndex = 0;

  do {
    stdout.write('\nГос. номер автомобиля или команда: ');
    incomingParameter1 = stdin.readLineSync().toString().trim();

    if (incomingParameter1.isEmpty) {
      print('\tВведите номер автомобиля!');
      continue;
    }

    switch (incomingParameter1) {
      case 'stop':
        {
          return;
        }
      case 'list':
        {
          showCarNumbersList(carNumbersList);
          break;
        }
      default:
        {
          stdout.write('\tНомер автомобиля в списке: ');
          incomingParameter2 = stdin.readLineSync().toString();

          if (!isNumber(incomingParameter2)) {
            break;
          }

          insertionIndex = int.parse(incomingParameter2) - 1;

          if (insertionIndex < carNumbersList.length) {
            carNumbersList.insert(insertionIndex, incomingParameter1);
          } else {
            carNumbersList.add(incomingParameter1);
            print('\tДобавлен номер: $incomingParameter1');
          }
        }
    }
  } while (true);
}
