import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project_valkyrie/core/constants/app_constants.dart';
import 'package:project_valkyrie/ui/styles/ui_helper.dart';
import 'package:project_valkyrie/core/view_models/parcels_view_model.dart';

class MyItemList<T extends ChangeNotifier> extends StatefulWidget {
  final int option;
  final dataMap;
  final Widget additionalTopWidget;
  final void Function(BuildContext context, String tapKey) onTapTile;

  MyItemList(
      {Key key,
      @required this.option,
      @required this.dataMap,
      this.additionalTopWidget,
      this.onTapTile})
      : super(key: key);

  @override
  _MyItemListState createState() => _MyItemListState();
}

class _MyItemListState extends State<MyItemList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        // add a bar if it is lostKeys view
        if (widget.additionalTopWidget != null) ...[
          UIHelper.verticalSpaceSmall,
          widget.additionalTopWidget,
        ],
        UIHelper.verticalSpaceMedium,
        Expanded(child: _buildItemList(context)),
      ],
    );
  }

  Widget _buildItemList(context) {
    final ParcelsViewModel storedList = Provider.of<ParcelsViewModel>(context);
    return storedList.busy
        ? Dialog(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(),
                Text('Loading...')
              ],
            ),
          )
        : ListView.builder(
            itemCount: widget.dataMap.length,
            itemBuilder: (BuildContext context, int index) {
              String id = widget.dataMap.keys.elementAt(index) as String;
              String title = 'Item: ' + id;
              String subtitle = widget.dataMap[id];
              bool isPickedUp = storedList.isPickedUp(id);
              return Container(
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(color: isPickedUp ? Colors.grey[300] : Colors.white, boxShadow: [
                  UIHelper.customBoxShadow,
                ]),
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  title: Text(
                    title,
                    style: TextStyle(
                            color: isPickedUp
                                ? Colors.black54
                                : Colors.black,
                            decoration: isPickedUp
                                ? TextDecoration.lineThrough
                                : null,
                          )
                  ),
                  trailing: Icon(Icons.more_vert),
                  subtitle: Text(subtitle),
                  onTap: () => widget.onTapTile(context, title),
                ),
              );
            });
  }
}
