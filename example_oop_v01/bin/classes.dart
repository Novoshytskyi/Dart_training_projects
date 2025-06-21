import 'main.dart';

class Employee {
  final String name;
  final String jobTitle;
  late final int _yearOfBirth;
  late final EmployeeGender _gender;
  double _salary = 0.0;

  Employee({
    required this.name,
    required this.jobTitle,
    required yearOfBirth,
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
  final String companyName;

  Director({
    required super.name,
    required super.jobTitle,
    required int super.yearOfBirth,
    required super.gender,
    required this.companyName,
  });

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

class Engineer extends Employee {
  Engineer({
    required super.name,
    required super.jobTitle,
    required super.yearOfBirth,
    required super.gender,
  });

  @override
  String work() => 'Разрабатывает ПО.';
}

class Security extends Employee {
  final double height;
  final double weight;

  Security({
    required super.name,
    required super.jobTitle,
    required super.yearOfBirth,
    required super.gender,
    required this.height,
    required this.weight,
  });

  @override
  String work() => 'Обеспечивает безопасность.';
}

class Cleaner extends Employee {
  Cleaner({
    required super.name,
    required super.jobTitle,
    required super.yearOfBirth,
    required super.gender,
  });

  @override
  String work() => 'Обеспечивает порядок в офисе.';
}
