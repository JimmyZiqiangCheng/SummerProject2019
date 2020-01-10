import 'package:project_valkyrie/core/view_models/base_view_model.dart';

class LostKeyItems extends BaseViewModel {
  List<String> collection = new List<String>();
  
  LostKeyItems() {
    initItem();
  }

  void initItem() {
    
  }

  void addItem(item) {
    collection.add(item);
    notifyListeners();
  }

  void removeItem(item) {
    collection.remove(item);
    notifyListeners();
  }

  bool containsItem(item) {
    return collection.contains(item);
  }
}