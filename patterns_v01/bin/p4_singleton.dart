enum EmployeeGender { male, female }

class Employee {
  String name;
  late String jobTitle;
  late int _yearOfBirth;
  late EmployeeGender _gender;
  double _salary = 0.0;

  Employee({
    required this.name,
    required this.jobTitle,
    required int yearOfBirth,
    required EmployeeGender gender,
  }) {
    _yearOfBirth = yearOfBirth;
    _gender = gender;
  }

  int _age() {
    return DateTime.now().year - _yearOfBirth;
  }

  String work() {
    return 'Выполняет должностные обязанности.';
  }

  double get employeeSalary {
    return _salary;
  }

  set setSalary(double value) {
    _salary = value;
  }

  bool get needReservation {
    if ((_age() >= 25 && _age() < 60) && _gender == EmployeeGender.male) {
      return true;
    } else {
      return false;
    }
  }

  bool get needToGiveFlowers => _gender == EmployeeGender.female ? true : false;

  @override
  String toString() {
    return '$name - $jobTitle';
  }
}

class Director extends Employee {
  late String companyName;

  Director._internal({
    required super.name,
    required super.jobTitle,
    required super.yearOfBirth,
    required super.gender,
    required this.companyName,
  });

  static final Director _instance = Director._internal(
    name: '',
    jobTitle: '',
    yearOfBirth: 0,
    gender: EmployeeGender.male,
    companyName: '',
  );

  static Director get instance => _instance;

  @override
  String work() => 'Находит заказы и руководит коллективом.';

  @override
  String toString() {
    return '$name - $jobTitle - $companyName';
  }
}

class Accountant extends Employee {
  Accountant({
    required super.name,
    required super.jobTitle,
    required super.yearOfBirth,
    required super.gender,
  });

  @override
  String work() => 'Ведет бухгалтерию и начисляет зарплату.';
}

void printCompanyInfo(List<Employee> list) {
  print('\n\tСотрудники компании (${list.length} чел.):');
  for (var e in list) {
    print(e);
  }
}

void main(List<String> arguments) {
  Director director = Director.instance
    ..name = 'Петр Петрович'
    ..jobTitle = 'Директор'
    .._yearOfBirth = 1980
    .._gender = EmployeeGender.male
    ..companyName = '"Лучшая компания"';

  print(director);

  // Director director2 = Director.instance
  //   ..name = 'Иван Иванович'
  //   ..jobTitle = 'Директор'
  //   .._yearOfBirth = 1990
  //   .._gender = EmployeeGender.male
  //   ..companyName = '"Лучшая компания 2"';

  Director director2 = Director.instance;
  print(director2);

  // Director director3 = Director.instance;
  // print(director3);

  Accountant accountant = Accountant(
    name: 'Наталья Сергеевна',
    jobTitle: 'Бухгалтер',
    yearOfBirth: 1974,
    gender: EmployeeGender.female,
  );

  List<Employee> employeesList = [director, accountant, director2];

  printCompanyInfo(employeesList);
}
