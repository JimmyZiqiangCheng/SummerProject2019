import 'package:flutter/material.dart';
import 'package:project_valkyrie/core/constants/app_constants.dart';
import 'package:project_valkyrie/core/view_models/item_list_view_model.dart';
import 'package:project_valkyrie/ui/shared_widgets/my_item_list.dart';
import 'package:project_valkyrie/ui/views/base_views/base_view_with_appbar.dart';


class ParcelView extends StatelessWidget {
  final _dataMap =<String, String>{
      'ADL000119': '2019.08.10 front desk',
      'ADL000120': '2019.09.15 front desk',
      'ADL000121': '2019.10.1 front desk',
      'ADL000122': '2019.10.10 front desk',
      'ADL000123': '2019.10.12 parcel locker',
      'ADL000124': '2019.11.11 front desk',
      'ADL000125': '2019.12.1 parcel locker',
      'ADL000126': '2019.12.10 parcel locker',
      'ADL000127': '2019.12.15 front desk',
  };

  @override
  Widget build(BuildContext context) {
    return BaseViewWithAppBar(
      model: ItemListViewModel(), // View model of the view
      child: MyItemList(listOption: ListOptions.parcelList, dataMap: _dataMap,),
      routePath: RoutePaths.parcel,
      builder: (context, model, child) => child,
    );
  }
}