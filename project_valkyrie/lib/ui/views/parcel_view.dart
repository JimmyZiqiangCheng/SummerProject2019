import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:project_valkyrie/core/constants/app_constants.dart';
import 'package:project_valkyrie/ui/shared_widgets/my_dialog.dart';
import 'package:project_valkyrie/ui/shared_widgets/my_item_list.dart';
import 'package:project_valkyrie/ui/views/base_views/base_view_with_appbar.dart';
import 'package:project_valkyrie/core/view_models/parcels_view_model.dart';

class ParcelView<T extends ChangeNotifier> extends StatelessWidget {
  final String customTextButton = "OK Button";

  void onTapTile(BuildContext context, String title) {
    print("Show dialog with Parcel Item on Tapped! $title");
    //_showCustomDialog(context, title);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return MyDialog(
          title: title,
          subTitle: title,
          dialogBody: generatQR(title),
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
    return Column(
      children: <Widget>[
        //UIHelper.horizontalLine(color: Colors.grey),
        Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          margin: EdgeInsets.only(top: 48.0, bottom: 48.0),
          child: QrImage(
            padding: EdgeInsets.all(16.0),
            data: key,
            version: QrVersions.auto,
            size: 220,
            gapless: false,
          ),
        ),
        //UIHelper.horizontalLine(color: Colors.grey),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final ParcelsViewModel _model =
        ParcelsViewModel(parcelsService: Provider.of(context));

    return BaseViewWithAppBar(
      model: _model, // View model of the view
      child: MyItemList(
        option: ListOptions.parcelList,
        dataMap: _model.getData(),
        onTapTile: onTapTile,
      ),
      routePath: RoutePaths.parcel,
      builder: (context, model, child) => child,
    );
  }
}
