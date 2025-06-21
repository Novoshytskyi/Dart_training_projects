String valueConverter(Map conversionRules, object) {
  var unit = object['distance']['unit'];
  var value = object['distance']['value'];
  var convertTo = object['convert_to'];

  double outputDouble = double.parse(value.toString()) *
      double.parse(conversionRules[unit][convertTo].toString());

  return '{"unit": "$convertTo", "value": ${outputDouble.toStringAsFixed(2)}}';
}
