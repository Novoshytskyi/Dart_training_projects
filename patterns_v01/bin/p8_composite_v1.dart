abstract class AbstractPurchase {
  String name();
  double price();
}

class Purchase implements AbstractPurchase {
  final String _name;
  final double _price;

  Purchase(this._name, this._price);

  @override
  String name() => _name;

  @override
  double price() => _price;

  @override
  String toString() => '$_name, \tЦена: $_price грн.';
}

class ShoppingPackage implements AbstractPurchase {
  final String _name;
  double _pricePurchase = 0.0;
  final _purchaseList = <AbstractPurchase>[];

  ShoppingPackage(this._name);

  @override
  String name() => _name;

  @override
  double price() {
    _pricePurchase = 0;
    for (var element in _purchaseList) {
      _pricePurchase += element.price();
    }
    return _pricePurchase;
  }

  void addPurchase(AbstractPurchase purchase) {
    _purchaseList.add(purchase);
  }

  void removePurchase(AbstractPurchase purchase) {
    _purchaseList.remove(purchase);
  }

  @override
  String toString() => '$_name, \tОбщая сумма: ${price()} грн.';
}

void main(List<String> args) {
  Purchase purchase1 = Purchase('Сыр', 275.0);
  Purchase purchase2 = Purchase('Масло', 100.0);
  Purchase purchase3 = Purchase('Хлеб', 25.0);

  ShoppingPackage santim = ShoppingPackage('Сантим');

  santim.addPurchase(purchase1);
  santim.addPurchase(purchase2);
  santim.addPurchase(purchase3);

  print(santim);

  Purchase purchase4 = Purchase('Торт', 275.0);
  Purchase purchase5 = Purchase('Шампанское', 275.0);

  ShoppingPackage silpo = ShoppingPackage('Сильпо');

  silpo.addPurchase(purchase4);
  silpo.addPurchase(purchase5);

  print(silpo);

  Purchase purchase6 = Purchase('Сникерс', 50.0);
  print(purchase6);

  ShoppingPackage bigPack = ShoppingPackage('Большой пакет');

  bigPack.addPurchase(purchase6);
  bigPack.addPurchase(santim);
  bigPack.addPurchase(silpo);

  print('');
  print(bigPack);

  bigPack.removePurchase(purchase6);
  // bigPack.removePurchase(santim);
  // bigPack.removePurchase(silpo);
  print('');
  print(bigPack);
}
