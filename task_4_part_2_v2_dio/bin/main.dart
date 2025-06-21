import 'currencies.dart';

void main(List<String> arguments) async {
  CurrenciesList currenciesList;

  currenciesList = await getCurrenciesListFromDio();

  var usd2 = currenciesList.currencies[32];
  var eur2 = currenciesList.currencies[39];

  print(
      '1 ${usd2.nameCurrency} (${usd2.labelCurrency}) \tстоит\t${usd2.rateCurrency} грн.');
  print(
      '1 ${eur2.nameCurrency} (${eur2.labelCurrency}) \t\tстоит\t${eur2.rateCurrency} грн.');

  for (var j in currenciesList.currencies) {
    print('1 ${j.labelCurrency}\tстоит\t${j.rateCurrency} грн.');
  }
}
