import 'dart:convert';

import 'package:http/http.dart' as http;

class CurrenciesList {
  List<Currency> currencies;
  CurrenciesList({required this.currencies});

  factory CurrenciesList.fromJson(List<dynamic> json) {
    var currenciesJson = json;

    List<Currency> currenciesList =
        currenciesJson.map((i) => Currency.fromJson(i)).toList();

    return CurrenciesList(currencies: currenciesList);
  }
}

class Currency {
  final String nameCurrency;
  final double rateCurrency;
  final String labelCurrency;

  Currency(
      {required this.nameCurrency,
      required this.rateCurrency,
      required this.labelCurrency});

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      nameCurrency: json['txt'] as String,
      rateCurrency: json['rate'] as double,
      labelCurrency: json['cc'] as String,
    );
  }
}

Future<CurrenciesList> getCurrenciesList() async {
  const url =
      'https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?json';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return CurrenciesList.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}
