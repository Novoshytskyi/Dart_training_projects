import 'classes.dart';
import 'functions.dart';

enum EmployeeGender { male, female }

void main(List<String> arguments) {
  Director director = Director(
      name: 'Петр Петрович',
      jobTitle: 'Директор',
      yearOfBirth: 1980,
      gender: EmployeeGender.male,
      companyName: '"Лучшая компания"');

  Accountant accountant = Accountant(
    name: 'Наталья Сергеевна',
    jobTitle: 'Бухгалтер',
    yearOfBirth: 1974,
    gender: EmployeeGender.female,
  );

  Engineer engineer1 = Engineer(
    name: 'Андрей',
    jobTitle: 'Разработчик ПО',
    yearOfBirth: 1998,
    gender: EmployeeGender.male,
  );

  Engineer engineer2 = Engineer(
    name: 'Михаил',
    jobTitle: 'Разработчик ПО',
    yearOfBirth: 2005,
    gender: EmployeeGender.male,
  );

  Engineer engineer3 = Engineer(
    name: 'Марина',
    jobTitle: 'Разработчик ПО',
    yearOfBirth: 2000,
    gender: EmployeeGender.female,
  );

  Security security = Security(
    name: 'Паша',
    jobTitle: 'Гарант безопасности',
    yearOfBirth: 1971,
    gender: EmployeeGender.male,
    height: 185,
    weight: 100,
  );

  Cleaner cleaner = Cleaner(
    name: 'Людмила',
    jobTitle: 'Менеджер чистоты',
    yearOfBirth: 1985,
    gender: EmployeeGender.female,
  );

  List<Employee> employeesList = [
    director,
    accountant,
    engineer1,
    engineer2,
    engineer3,
    security,
    cleaner,
  ];

  printCompanyInfo(employeesList);

  printHowWhoWorks(employeesList);

  printNeedReservation(employeesList);

  printNeedToGiveFlowers(employeesList);
}
