import 'package:flutter/foundation.dart';

class NotificationService with ChangeNotifier{
  var notificationCounter = 0;

  void plus() {
    notificationCounter += 1;
    notifyListeners();
  }

  void minus(){
    notificationCounter -= 1;
    notifyListeners();
  }

  int get counter {
    return notificationCounter;
  }
}