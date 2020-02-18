import 'package:flutter/material.dart';
import 'package:project_valkyrie/ui/shared_widgets/my_tile.dart';
import 'package:project_valkyrie/ui/styles/ui_helper.dart';

class MyTilesCombo extends StatefulWidget {
  final myTileItems = [
    ['this is title','here is description hahahaha long and be hold...'],
    ['this is title','here is description hahahaha long and be hold...'],
    ['this is title','here is description hahahaha long and be hold...'],
    ['this is title','here is description hahahaha long and be hold...'],
    ['this is title','here is description hahahaha long and be hold...'],
    ['this is title','here is description hahahaha long and be hold...'],
    ['this is title','here is description hahahaha long and be hold...'],
    ['this is title','here is description hahahaha long and be hold...'],
    ['this is title','here is description hahahaha long and be hold...'],
    ['this is title','here is description hahahaha long and be hold...'],
    ['this is title','here is description hahahaha long and be hold...'],
    ['this is title','here is description hahahaha long and be hold...'],
  ];
  @override
  _MyTilesComboState createState() => _MyTilesComboState();
}

class _MyTilesComboState extends State<MyTilesCombo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        UIHelper.verticalSpaceMedium,
        Expanded(child:_buildTiles()),
      ],
    );
  }

  Widget _buildTiles(){
    return ListView.builder(
        itemCount: widget.myTileItems.length,
        itemBuilder: (BuildContext context, int index){
          return MyTile(title: widget.myTileItems[index][0], contents: widget.myTileItems[index][1],);
        }
    );
  }
}

