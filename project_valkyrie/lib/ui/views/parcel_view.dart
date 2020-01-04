import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:project_valkyrie/core/constants/app_constants.dart';
import 'package:project_valkyrie/core/view_models/item_list_view_model.dart';
import 'package:project_valkyrie/ui/shared_widgets/my_dialog.dart';
import 'package:project_valkyrie/ui/shared_widgets/my_item_list.dart';
import 'package:project_valkyrie/ui/views/base_views/base_view_with_appbar.dart';

class ParcelView extends StatelessWidget {
  final String customTextButton = "OK Button";
  final _dataMap = <String, String>{
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

  void onTapTile(BuildContext context, ItemListViewModel list, String key) {
    print("Show dialog with Parcel Item on Tapped! $key");
    //_showCustomDialog(context, key);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return MyDialog(
          title: key,
          subTitle: _dataMap[key],
          dialogBody: generatQR('1928485'),
          customTextButton: null,
        //   enableTopRightIcon: true,
        //   topRightIconOnTap: () {
        //     print('Top Right Button tapped!');
        //   },
        //   topRightIcon: Icon(
        //     Icons.ac_unit,
        //     size: 28.0,
        //     color: Colors.black87,
        //   ),
        );
      },
    );
  }

  Widget generatQR(String key) {
    return QrImage(
      data: key,
      version: QrVersions.auto,
      size: 240,
      gapless: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseViewWithAppBar(
      model: ItemListViewModel(), // View model of the view
      child: MyItemList(
        option: ListOptions.parcelList,
        dataMap: _dataMap,
        onTapTile: onTapTile,
      ),
      routePath: RoutePaths.parcel,
      builder: (context, model, child) => child,
    );
  }
}
