import 'cards.dart';
import 'store.dart';

void main(List<String> arguments) {
  var marketStore = MarketStore();

  marketStore.issueCardToCustomer('Josh Thompson', 0, BronzeCard);
  marketStore.issueCardToCustomer('Dave Smith', 600.0, SilverCard);
  marketStore.issueCardToCustomer('Mark Robertson', 15000.0, String);
  marketStore.issueCardToCustomer('Jane Peterson', 1500.0, GoldCard);

  try {
    marketStore.listOfIssuedCards[0].makePurchase(150.0);
    marketStore.listOfIssuedCards[1].makePurchase(850.0);
    marketStore.listOfIssuedCards[2].makePurchase(1300.0);
  } on AssertionError catch (err) {
    print('ERROR: ${err.message}');
  } catch (ex) {
    print('${ex.toString()}\n');
  }
}
