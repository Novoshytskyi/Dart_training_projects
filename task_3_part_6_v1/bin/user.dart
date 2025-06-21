class User {
  final int _id;
  final String _name;
  final String _surname;
  final int _age;

  User(
    this._id,
    this._name,
    this._surname,
    this._age,
  );

  int get id => _id;
  String get name => _name;
  String get surname => _surname;
  int get age => _age;

  @override
  String toString() =>
      'id: $_id,\tимя: $_name,\tфамилия: $_surname,\tвозраст: $_age. ';
  // @override
  // String toString() =>
  //     'id: $_id\nимя: $_name \nфамилия: $_surname \nвозраст: $_age\n ';
}
