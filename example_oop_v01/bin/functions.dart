import 'classes.dart';

void printNeedReservation(List<Employee> list) {
  print('\n\tЗабронировать сотрудников:');
  for (var i in list) {
    if (i.needReservation) {
      print(i);
    }
  }
}

void printNeedToGiveFlowers(List<Employee> list) {
  print('\n\tПоздравить с 8 Марта:');
  for (var i in list) {
    if (i.needToGiveFlowers) {
      print(i);
    }
  }
}

void printCompanyInfo(List<Employee> list) {
  print('\n\tСотрудники компании (${list.length} чел.):');
  for (var e in list) {
    print(e);
  }
}

void printHowWhoWorks(List<Employee> list) {
  print('\n\tЧто делают сотрудники:');
  for (var e in list) {
    String info = '$e - ${e.work()}';
    print(info);
  }
}
