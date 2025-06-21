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
//     print(car);
//   }
//   print('');
// }

// void main(List<String> args) {
//   final List<Car> carNumbersList = [];
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
//           showCarNumbersList(carNumbersList);
//           break;
//         }
//       default:
//         {
//           if (incomingParameter.isNotEmpty) {
//             carNumbersList.add(Car(carNumber: incomingParameter));
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
    print(car);
  }
  print('');
}

void main(List<String> args) {
  final List<String> carNumbersList = [];
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
          showCarNumbersList(carNumbersList);
          break;
        }
      default:
        {
          if (incomingParameter.isNotEmpty) {
            carNumbersList.add(incomingParameter);
          }
        }
    }
  } while (true);
}
