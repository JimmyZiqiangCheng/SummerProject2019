import 'package:flutter/foundation.dart';

class ParcelNotifier with ChangeNotifier{
  var collected = [];

  void addItem(item) {
    collected.add(item);
    notifyListeners();
  }

  void removeItem(item){
    collected.remove(item);
    notifyListeners();
  }

  bool containsItem(item) {
    return collected.contains(item);
  }
}