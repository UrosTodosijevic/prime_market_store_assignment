import 'cards.dart';

class MarketStore {
  List<Card> listOfIssuedCards = [];

  void issueCardToCustomer(
      String owner, double lastMonthTurnover, Type cardType) {
    try {
      switch (cardType) {
        case BronzeCard:
          listOfIssuedCards.add(BronzeCard(owner, lastMonthTurnover));
          break;
        case SilverCard:
          listOfIssuedCards.add(SilverCard(owner, lastMonthTurnover));
          break;
        case GoldCard:
          listOfIssuedCards.add(GoldCard(owner, lastMonthTurnover));
          break;
        default:
          throw Exception('Wrong card type! - \"$cardType\" is not a card type.');
      }
    } on AssertionError catch (err) {
      print('ERROR: ${err.message}');
    } on Exception catch (ex) {
      print('${ex.toString()}\n');
    }
  }

  void cancelCard(int index) {
    listOfIssuedCards.removeAt(index);
  }
}
