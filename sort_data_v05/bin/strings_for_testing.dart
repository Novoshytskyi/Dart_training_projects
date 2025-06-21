String listJson1 = '''
{
  "data": [
    {"name": "John", "email": "john2@mail.com"},
    {"name": "John", "email": "john1@mail.com"},
    {"name": "Jane", "email": "jane@mail.com"}
  ],
  "condition": {
    "include": [ {"name": "John"} ],
    "sort_by": ["email"]
  }
}''';

String listJson1_ = '''
{"data":[{"name":"John","email":"john2@mail.com"},{"name":"John","email":"john1@mail.com"},{"name":"Jane","email":"jane@mail.com"}],"condition":{"include":[{"name": "John"}],"sort_by":["email"]}}
''';

String listJson2 = '''
{
  "data": [
    {"user": "mike@mail.com", "rating": 20, "disabled": false},
    {"user": "greg@mail.com", "rating": 14, "disabled": false},
    {"user": "john@mail.com", "rating": 25, "disabled": true}
  ],
  "condition": {
    "exclude": [
      {"disabled": true}
    ],
    "sort_by": ["rating"]
  }
}''';

String listJson2_ = '''
{"data":[{"user":"mike@mail.com","rating":20,"disabled":false},{"user":"greg@mail.com", "rating":14,"disabled":false},{"user":"john@mail.com","rating":25,"disabled":true}],"condition":{"exclude":[{"disabled":true}],"sort_by":["rating"]}}
''';

String listJson3 = '''
{
  "data": [
    {"name": "Аня", "email": "anna2@mail.com"},
    {"name": "Ева", "email": "eva2@mail.com"},
    {"name": "Аня", "email": "anna3@mail.com"},
    {"name": "Аня", "email": "anna1@mail.com"},
    {"name": "Яна", "email": "jana1@mail.com"},
    {"name": "Оля", "email": "olga1@mail.com"},
    {"name": "Ева", "email": "aaeva1@mail.com"},
    {"name": "Лия", "email": "lija@mail.com"},
    {"name": "Лея", "email": "leja@mail.com"},
    {"name": "Аня", "email": "anna4@mail.com"}
  ],
  "condition": {
    "include": [ {"name": "Ева"}, {"name": "Аня"} ],
    "sort_by": ["email"]
  }
}''';

String listJson4 = '''
{
  "data": [
    {"name": "Аня", "email": "anna2@mail.com"},
    {"name": "Ева", "email": "eva2@mail.com"},
    {"name": "Аня", "email": "anna3@mail.com"},
    {"name": "Аня", "email": "anna1@mail.com"},
    {"name": "Яна", "email": "jana1@mail.com"},
    {"name": "Оля", "email": "olga1@mail.com"},
    {"name": "Ева", "email": "aaeva1@mail.com"},
    {"name": "Лия", "email": "lija@mail.com"},
    {"name": "Лея", "email": "leja@mail.com"},
    {"name": "Аня", "email": "anna4@mail.com"}
  ],
  "condition": {
  "exclude": [ {"name": "Ева"}, {"name": "Аня"}, {"name": "Лия"}, {"name": "Яна"} ],
    "sort_by": ["email"]
  }
}''';
