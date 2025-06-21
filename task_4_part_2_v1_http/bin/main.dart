import 'currencies.dart';

void main(List<String> arguments) async {
  CurrenciesList currenciesList;

  currenciesList = await getCurrenciesList();

  var usd = currenciesList.currencies[32];
  var eur = currenciesList.currencies[39];

  print(
      '1 ${usd.nameCurrency} (${usd.labelCurrency}) \tстоит\t${usd.rateCurrency} грн.');
  print(
      '1 ${eur.nameCurrency} (${eur.labelCurrency}) \t\tстоит\t${eur.rateCurrency} грн.');

  for (var j in currenciesList.currencies) {
    print('1 ${j.labelCurrency}\tстоит\t${j.rateCurrency} грн.');
  }
}
