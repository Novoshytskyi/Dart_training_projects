// import 'dart:io';

// class Car {
//   final String carNumber;

//   Car({required this.carNumber});
//   @override
//   String toString() => carNumber;
// }

// void showCarNumbersList(Iterable<Car> numbersList) {
//   print('\tНомера автомобилей:');
//   for (Car car in numbersList) {
//     print(car);
//   }
//   print('');
// }

// bool numberNotContains(Iterable<Car> searchSet, String searchedNumber) {
//   List<String> list = [];
//   for (Car car in searchSet) {
//     list.add(car.carNumber);
//   }

//   return list.contains(searchedNumber) ? false : true;
// }

// void main(List<String> args) {
//   final Set<Car> carNumbersSet = {};
//   String? incomingParameter;

//   do {
//     stdout.write('Гос. номер автомобиля или команда: ');
//     incomingParameter = stdin.readLineSync().toString().trim();

//     switch (incomingParameter) {
//       case 'stop':
//         {
//           return;
//         }
//       case 'list':
//         {
//           showCarNumbersList(carNumbersSet);
//           break;
//         }
//       default:
//         {
//           if (numberNotContains(carNumbersSet, incomingParameter) &&
//               incomingParameter.isNotEmpty) {
//             carNumbersSet.add(Car(carNumber: incomingParameter));
//           }
//         }
//     }
//   } while (true);
// }

//=============================================================================

import 'dart:io';

void showCarNumbersList(Iterable<String> numbersList) {
  print('\tНомера автомобилей:');
  for (String car in numbersList) {
    print(car);
  }
  print('');
}

void main(List<String> args) {
  final Set<String> carNumbersSet = {};
  String? incomingParameter;

  do {
    stdout.write('Гос. номер автомобиля или команда: ');
    incomingParameter = stdin.readLineSync().toString().trim();

    switch (incomingParameter) {
      case 'stop':
        {
          return;
        }
      case 'list':
        {
          showCarNumbersList(carNumbersSet);
          break;
        }
      default:
        {
          if (incomingParameter.isNotEmpty) {
            carNumbersSet.add(incomingParameter);
          }
        }
    }
  } while (true);
}
