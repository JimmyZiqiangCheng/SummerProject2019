import 'package:flutter/material.dart';
import 'package:project_valkyrie/core/constants/app_constants.dart';
import 'package:project_valkyrie/core/view_models/item_list_view_model.dart';
import 'package:provider/provider.dart';

class MyItemList <T extends ChangeNotifier>  extends StatefulWidget {
  final int listOption;
  final dataMap;
  final T model;
  MyItemList({@required this.listOption, @required this.dataMap, this.model});

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
        if (widget.listOption == ListOptions.lostKeysList) ...[
          const SizedBox(height: 8.0),
          _buildAddItem(),
        ],
        const SizedBox(height: 8.0),
        const SizedBox(height: 8.0),
        Expanded(child: _buildItemList(context)),
      ],
    );
  }

  Widget _buildAddItem() {
    return Container(
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey[400],
          blurRadius: 3.0,
          spreadRadius: 1.0,
          offset: Offset(3.0, 3.0),
        )
      ]),
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ListTile(
          title: Text(
            "New",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          trailing: Icon(Icons.add),
          onTap: () {}),
    );
  }

  Widget _buildItemList(context) {
    final collection = Provider.of<ItemListViewModel>(context);
    return ListView.builder(
        itemCount: widget.dataMap.length,
        itemBuilder: (BuildContext context, int index) {
          String key = widget.dataMap.keys.elementAt(index);
          return Container(
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.grey[400],
                blurRadius: 3.0,
                spreadRadius: 1.0,
                offset: Offset(3.0, 3.0),
              )
            ]),
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: ListTile(
                title: Text(
                  key,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: collection.containsItem(key)
                        ? Colors.grey[300]
                        : Colors.black,
                    decoration: collection.containsItem(key)
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
                trailing: Icon(Icons.more_vert),
                subtitle: Text('${widget.dataMap[key]}'),
                onTap: () {
                  collection.containsItem(key)
                      ? collection.removeItem(key)
                      : collection.addItem(key);
                }),
          );
        });
  }
}
