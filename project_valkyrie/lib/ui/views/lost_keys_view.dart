import 'package:flutter/material.dart';
import 'package:project_valkyrie/core/constants/app_constants.dart';
import 'package:project_valkyrie/core/view_models/item_list_view_model.dart';
import 'package:project_valkyrie/ui/shared_widgets/my_add_list_item.dart';
import 'package:project_valkyrie/ui/shared_widgets/my_item_list.dart';
import 'package:project_valkyrie/ui/views/base_views/base_view_with_appbar.dart';



class LostKeysView extends StatelessWidget {

  final _dataMap =<String, String>{
    'KL0000001': '2019.10.12 Key Missing',
    'KL0000002': '2019.11.09 Key Missing',
    'KL0000003': '2019.12.21 Key Missing',
  };
  void onTapAddIcon(){
    print('add item clicked...');
  }

  void onTapTile(BuildContext context, ItemListViewModel list, String key){
    list.containsItem(key)? list.removeItem(key) : list.addItem(key);
  }

  @override
  Widget build(BuildContext context) {
    return BaseViewWithAppBar(
      model: ItemListViewModel(),
      child: MyItemList(option: ListOptions.lostKeysList, dataMap: _dataMap, additionalTopWidget: AddListItem(onTap: onTapAddIcon), onTapTile: onTapTile,),
      routePath: RoutePaths.lostKeys,
      builder: (context, model, child) => child,
    );
  }
}