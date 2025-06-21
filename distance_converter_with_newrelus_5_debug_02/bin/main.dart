import 'dart:convert';
import 'dart:io';

import 'conversion_rules.dart';
import 'functions.dart';

void main(List<String> arguments) {
  String? incomingParameters;
  dynamic objectFromJson;
  bool isDistance;
  bool isRules;
  String? outputData;

  do {
    stdout.write('Incoming parameters:\n');
    incomingParameters = stdin.readLineSync().toString();
    //!========================================================================
    // String stroka =
    //     '{"distance": {"unit": "in","value": "10"},"convert_to": "cm"}';
    // String stroka =
    //     '{"rules":{"m":{"mm":"1000.0","km":"0.001","yd":"1.0936"},"cm":{"mm":"10.0","km":"0.00001","yd":"0.010936"},"in":{"mm":"25.4","km":"0.0000254","yd":"0.027778"},"ft":{"mm":"304.8","km":"0.000304803","yd":"0.33333"},"mm":{"m":"0.001","cm":"0.1","in":"0.03937","ft":"0.0032808","km":"0.000001","yd":"0.0010936"},"km":{"m":"1000.0","cm":"100000.0","in":"39370.0","ft":"3280.8","mm":"1000000.0","yd":"1093.6"},"yd":{"m":"0.91441","cm":"91.4411","in":"36.0","ft":"3.0","mm":"914.411","km":"0.00091441"}}}';
    // incomingParameters = stroka;
    //!========================================================================

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

    // try {
    isDistance = objectFromJson.keys.toList().contains('distance');
    isRules = objectFromJson.keys.toList().contains('rules');

    if (isRules) {
      // print('\n\nisRules');

      objectFromJson = (objectFromJson as Map<String, dynamic>)['rules'];
      // print(objectFromJson); // todo DELETE!

      rules.ruleExpansion(objectFromJson);

      outputData = 'New rules added.';
    } else if (isDistance) {
      // print('isDistance');

      outputData = valueConverter(conversionRulesMap, objectFromJson);
    } else {
      outputData = 'Incorrect input data 1';
    }
    // } catch (e) {
    //   outputData = 'Incorrect input data 2: Incoming parameters';
    // }

    print('$outputData\n');
  } while (incomingParameters != '0');
}
