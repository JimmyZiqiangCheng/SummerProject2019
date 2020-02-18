import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project_valkyrie/core/constants/app_constants.dart';
import 'package:project_valkyrie/core/view_models/item_list_view_model.dart';
import 'package:project_valkyrie/ui/styles/ui_helper.dart';

class MyItemList <T extends ChangeNotifier>  extends StatefulWidget {
  final int option;
  final dataMap;
  final Widget additionalTopWidget;
  final void Function(BuildContext context, ItemListViewModel list, String tapKey) onTapTile;
  MyItemList({Key key, @required this.option, @required this.dataMap, this.additionalTopWidget, this.onTapTile}) 
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
    final storedList = Provider.of<ItemListViewModel>(context);
    return ListView.builder(
        itemCount: widget.dataMap.length,
        itemBuilder: (BuildContext context, int index) {
          // if it is events, it is not key value pair but a list
          String title;
          widget.option == ListOptions.eventList ? title = widget.dataMap[index]
            :title = widget.dataMap.keys.elementAt(index);
          
          return Container( 
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              UIHelper.customBoxShadow,
            ]),
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: ListTile(
              title: Text(
                title,
                style: widget.option == ListOptions.parcelList || widget.option == ListOptions.lostKeysList
                  ? TextStyle(
                  color: storedList.containsItem(title)
                      ? Colors.grey[300]
                      : Colors.black,
                  decoration: storedList.containsItem(title)
                      ? TextDecoration.lineThrough
                      : null,
                ) : null,
              ),
              trailing: Icon(Icons.more_vert),
              subtitle: widget.option == ListOptions.parcelList || widget.option == ListOptions.lostKeysList 
                ? Text('${widget.dataMap[title]}'):null,
              onTap: () => widget.onTapTile(context, storedList, title),
            ),
          );
        });
  }
}
