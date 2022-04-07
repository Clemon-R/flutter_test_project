import 'package:test_project/job/services/ispeedit_service.dart';

class SpeeditService extends ISpeeditService {
  @override
  String splitArticlesByCards(String articles) {
    if (articles.isEmpty) return "";
    var queue = <int>[];
    for (var charCode in articles.runes) {
      queue.add(int.parse(String.fromCharCode(charCode)));
    }
    var cards = _createCards(queue.toList());

    return _cardsToString(cards);
  }

  String _cardsToString(List<List<int>> cards) {
    return cards.map((e) => e.join()).join("/");
  }

  List<List<int>> _createCards(List<int> articles) {
    var prevSum = 0;
    var currentSum = 0;
    var current = <int>[];
    var cards = <List<int>>[];

    while (true) {
      var baseVal = articles[0];

      current = <int>[];
      current.add(baseVal);
      currentSum = baseVal;
      for (var i = 1; i < articles.length; i++) {
        var val = articles[i];
        if (current.length >= 2 &&
            prevSum + val > currentSum &&
            prevSum + val <= 10) {
          current.removeLast();
          currentSum = prevSum;
        }
        if (currentSum + val <= 10) {
          current.add(val);
          prevSum = currentSum;
          currentSum += val;
        }
        if (currentSum == 10) {
          break;
        }
      }

      cards.add(_removeArticlesInStack(current, articles));

      if (articles.isEmpty) {
        break;
      }
    }
    return cards;
  }

  List<int> _removeArticlesInStack(List<int> articles, List<int> stack) {
    for (var element in articles) {
      stack.remove(element);
    }
    return stack;
  }
}
