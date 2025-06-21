import 'dart:convert';
import 'dart:math';

void main(List<String> args) {
  Random random = Random();

  Map<String, Object?> userObject = {
    'name': 'Имя',
    'password': 123456,
    'description': null,
    'status': 'new user',
  };

  String jsonFromObject = jsonEncode(userObject);
  print(jsonFromObject);

  var objectFromJson = jsonDecode(jsonFromObject);
  print(objectFromJson);

  String userObjectWithIdFieldToJson(Map object) {
    var idField = <String, int>{'id': random.nextInt(1000000)};
    object.addAll(idField);
    return jsonEncode(object);
  }

  print(userObjectWithIdFieldToJson(userObject));

  print(userObjectWithIdFieldToJson(userObject));
}
