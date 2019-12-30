
import 'package:project_valkyrie/core/view_models/base_view_model.dart';

class ItemListViewModel extends BaseViewModel {
  List<String> collected = new List<String>();
  
  ItemListViewModel() {
    initItem();
  }

  void initItem() {
    
  }

  void addItem(item) {
    collected.add(item);
    notifyListeners();
  }

  void removeItem(item) {
    collected.remove(item);
    notifyListeners();
  }

  bool containsItem(item) {
    return collected.contains(item);
  }
}