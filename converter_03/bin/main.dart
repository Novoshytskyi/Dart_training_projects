import 'dart:convert';
import 'dart:io';
import 'conversion_rules.dart';

void main(List<String> arguments) {
  String? incomingParameters;
  dynamic objectFromJson;
  bool isDistance;
  bool isRules;
  String? outputData;

  do {
    stdout.write('Incoming parameters:\n');
    incomingParameters = stdin.readLineSync().toString();

    dynamic jsonDecoding(String incomingJson) {
      try {
        return jsonDecode(incomingJson);
      } catch (e) {
        print(e);
      }
      print('jsonDecode error');
      return '-1';
    }

    objectFromJson = jsonDecoding(incomingParameters);

    try {
      isDistance = objectFromJson.keys.toList().contains('distance');
      isRules = objectFromJson.keys.toList().contains('rules');

      if (isRules) {
        objectFromJson = (objectFromJson)['rules'];
        print(objectFromJson); // todo DELETE!

        // ignore: unused_local_variable
        Rules rulesForAdding =
            Rules(objectFromJson.cast<String, Map<String, String>>());

        rules.ruleExpansion(objectFromJson);

        outputData = 'New rules added.';
      } else if (isDistance) {
        outputData = rules.conversion(objectFromJson);
      } else {
        outputData = 'Incorrect input data 1';
      }
    } catch (e) {
      outputData = 'Incorrect input data 2: Incoming parameters';
    }

    print('$outputData\n');
  } while (incomingParameters != '0');
}
