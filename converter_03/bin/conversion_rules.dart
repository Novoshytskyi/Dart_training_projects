class Rules {
  Rules(this.rules);

  final Map<String, Map<String, String>> rules;

  void ruleExpansion(newRules) {
    List<String> listOfKeyRules = rules.keys.toList();
    List<String> listOfKeyNewRules = newRules.keys.toList();

    for (String keyUnit in listOfKeyNewRules) {
      // ключ из новых правил НЕ содержится в старых правилах
      if (!listOfKeyRules.contains(keyUnit)) {
        rules.addAll({keyUnit: newRules[keyUnit]!});
      }
      // ключ из новых правил содержится в старых правилах
      if (listOfKeyRules.contains(keyUnit)) {
        // перезапись имеющихся правил
        Map<String, String> elementsForAdding = {};
        for (var i in rules[keyUnit]!.keys) {
          elementsForAdding.addAll({i: rules[keyUnit]![i].toString()});
        }

        for (var j in (newRules[keyUnit])!.keys) {
          elementsForAdding.addAll({j: newRules[keyUnit]![j].toString()});
        }
        rules[keyUnit]!.addAll(elementsForAdding);
      }
    }
  }

  String conversion(Map object) {
    Map conversionRules = rules;
    var unit = object['distance']['unit'];
    var value = object['distance']['value'];
    var convertTo = object['convert_to'];

    double outputDouble = double.parse(value.toString()) *
        double.parse(conversionRules[unit][convertTo]);

    return '{"unit": "$convertTo", "value": ${outputDouble.toStringAsFixed(2)}}';
  }
}

Map<String, Map<String, String>> conversionRulesMap = {
  'm': {
    'cm': '100.0',
    'in': '39.370',
    'ft': '3.2808',
  },
  'cm': {
    'm': '0.01',
    'in': '0.39370',
    'ft': '0.032808',
  },
  'in': {
    'cm': '2.54',
    'm': '0.0254',
    'ft': '0.083333',
  },
  'ft': {
    'cm': '30.48',
    'm': '0.3048',
    'in': '12.0',
  },
};

Rules rules = Rules(conversionRulesMap);
