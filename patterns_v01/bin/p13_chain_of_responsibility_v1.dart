enum Currency {
  eur('Евро'),
  usd('Доллар'),
  gbp('Фунт стерлингов'),
  chf('Швейцарский франк'),
  cny('Юань');

  final String localization;
  const Currency(this.localization);

  @override
  String toString() => localization;
}

abstract class Handler {
  void handle(Currency currency);
  void setSuccessor(Handler handler);
  void showResult(Currency currency);
}

abstract class CurrencyHandler implements Handler {
  Handler? _successor;

  @override
  void handle(Currency currency);

  @override
  void setSuccessor(Handler handler) {
    _successor = handler;
  }

  @override
  void showResult(Currency currency) {
    print('$currency конвертируем в гривны.');
  }
}

class EurCurrencyHandler extends CurrencyHandler {
  @override
  void handle(Currency currency) {
    if (currency == Currency.eur) {
      showResult(currency);
    } else if (_successor != null) {
      _successor!.handle(currency);
    }
  }
}

class UsdCurrencyHandler extends CurrencyHandler {
  @override
  void handle(Currency currency) {
    if (currency == Currency.usd) {
      showResult(currency);
    } else if (_successor != null) {
      _successor!.handle(currency);
    }
  }
}

class GbpCurrencyHandler extends CurrencyHandler {
  @override
  void handle(Currency currency) {
    if (currency == Currency.gbp) {
      showResult(currency);
    } else if (_successor != null) {
      _successor!.handle(currency);
    }
  }
}

void main(List<String> args) {
  Handler currencyHandler1 = EurCurrencyHandler();
  Handler currencyHandler2 = UsdCurrencyHandler();
  Handler currencyHandler3 = GbpCurrencyHandler();

  currencyHandler1.setSuccessor(currencyHandler2);
  currencyHandler2.setSuccessor(currencyHandler3);

  currencyHandler1.handle(Currency.eur);
  currencyHandler1.handle(Currency.usd);
  currencyHandler1.handle(Currency.gbp);

  currencyHandler1.handle(Currency.cny);
}
