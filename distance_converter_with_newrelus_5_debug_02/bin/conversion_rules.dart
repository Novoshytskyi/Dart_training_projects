class Rules {
  Rules(this.rules);

  final Map<String, Map<String, dynamic>> rules;

  // void ruleExpansion(Map<String, Map<String, String>> newRules) {
  void ruleExpansion(Map<String, dynamic> newRules) {
    List<String> listOfKeyRules = rules.keys.toList();
    List<String> listOfKeyNewRules = newRules.keys.toList();

    // print('listOfKeyRules: \t$listOfKeyRules'); // [m, cm, mm]
    // print('listOfKeyNewRules: \t$listOfKeyNewRules'); // [m, xxx]

    for (String keyUnit in listOfKeyNewRules) {
      //? ключ из новых правил НЕ содержится в старых правилах
      if (!listOfKeyRules.contains(keyUnit)) {
        rules.addAll({keyUnit: newRules[keyUnit]!});
      }
      //? ключ из новых правил содержится в старых правилах
      if (listOfKeyRules.contains(keyUnit)) {
        Map<String, dynamic> elementsForAdding = {};
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
}

Map<String, Map<String, dynamic>> conversionRulesMap = {
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

// for to JSON encoding
Map conversionNewRulesMap = {
  'rules': {
    'm': {'mm': '1000.0', 'km': '0.001', 'yd': '1.0936'},
    'cm': {'mm': '10.0', 'km': '0.00001', 'yd': '0.010936'},
    'in': {'mm': '25.4', 'km': '0.0000254', 'yd': '0.027778'},
    'ft': {'mm': '304.8', 'km': '0.000304803', 'yd': '0.33333'},
    'mm': {
      'm': '0.001',
      'cm': '0.1',
      'in': '0.03937',
      'ft': '0.0032808',
      'km': '0.000001',
      'yd': '0.0010936'
    },
    'km': {
      'm': '1000.0',
      'cm': '100000.0',
      'in': '39370.0',
      'ft': '3280.8',
      'mm': '1000000.0',
      'yd': '1093.6'
    },
    'yd': {
      'm': '0.91441',
      'cm': '91.4411',
      'in': '36.0',
      'ft': '3.0',
      'mm': '914.411',
      'km': '0.00091441'
    },
  },
};
