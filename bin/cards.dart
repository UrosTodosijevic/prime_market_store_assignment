abstract class Card {
  final String _owner;
  double _lastMonthTurnover;
  late double _discountRate;

  Card(this._owner, this._lastMonthTurnover) {
    _discountRate = _calculateDiscountRate();
  }

  String get owner => _owner;

  double get lastMonthTurnover => _lastMonthTurnover;

  double get discountRate => _discountRate;

  double _calculateDiscountRate();

  String typeOfCard();

  double _calculateDiscountForPurchase(double valueOfPurchase) {
    return valueOfPurchase * (_discountRate / 100.0);
  }

  void makePurchase(double purchaseValue) {
    assert(purchaseValue > 0, 'Value of purchase can\'t be negative number.');

    var discount = _calculateDiscountForPurchase(purchaseValue);

    var output = '- Customer: $_owner - ${typeOfCard()}\n';
    output += 'Purchase value: \$${purchaseValue.toStringAsFixed(2)}\n';
    output += 'Discount rate: $_discountRate%\n';
    output += 'Discount: \$${discount.toStringAsFixed(2)}\n';
    output += 'Total: \$${(purchaseValue - discount).toStringAsFixed(2)}\n';

    print(output);
  }
}

class BronzeCard extends Card {
  BronzeCard(String owner, double lastMonthTurnover)
      : assert(lastMonthTurnover >= 0, 'Turnover amount can\'t be negative.'),
        /* null check is unnecessary (dart 2.12 have sound null safety) */
        assert(owner.isNotEmpty, 'Owner name can\'t be empty.'),
        super(owner, lastMonthTurnover);

  @override
  double _calculateDiscountRate() {
    if (_lastMonthTurnover < 100.0) {
      return 0.0;
    } else if (_lastMonthTurnover >= 100.0 && _lastMonthTurnover < 300.0) {
      return 1.0;
    } else {
      return 2.5;
    }
  }

  @override
  String typeOfCard() {
    return 'Bronze Card';
  }
}

class SilverCard extends Card {
  SilverCard(String owner, double lastMonthTurnover)
      : assert(lastMonthTurnover >= 0, 'Turnover amount can\'t be negative.'),
        assert(owner.isNotEmpty, 'Owner name can\'t be empty.'),
        super(owner, lastMonthTurnover);

  @override
  double _calculateDiscountRate() {
    if (_lastMonthTurnover > 300.0) {
      return 3.5;
    } else {
      return 2.0;
    }
  }

  @override
  String typeOfCard() {
    return 'Silver Card';
  }
}

class GoldCard extends Card {
  GoldCard(String owner, double lastMonthTurnover)
      : assert(lastMonthTurnover >= 0, 'Turnover amount can\'t be negative.'),
        assert(owner.isNotEmpty, 'Owner name can\'t be empty.'),
        super(owner, lastMonthTurnover);

  @override
  double _calculateDiscountRate() {
    if (_lastMonthTurnover >= 800.0) {
      return 10.0;
    } else {
      return 2.0 + (_lastMonthTurnover ~/ 100);
    }
  }

  @override
  String typeOfCard() {
    return 'Gold Card';
  }
}
