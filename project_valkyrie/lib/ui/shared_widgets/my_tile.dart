import 'package:flutter/material.dart';
import 'package:project_valkyrie/ui/styles/ui_helper.dart';

class MyTile extends StatelessWidget {
  final Icon headingIcon;
  final String title;
  final String contents;

  // only need to provide heading icon if title is not predefined.
  // current predefined titles include 'date', 'time' and 'description' under 'CustomTileOptions'.
  MyTile(
      {Key key,
      this.headingIcon,
      @required this.title,
      @required this.contents})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:32.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: UIHelper.verticalMarginSmall,
                    right: UIHelper.horizontalMarginLarge),
                child:
                    headingIcon == null ? Icon(Icons.access_alarms) : headingIcon,
              ),
              Column(
                children: <Widget>[
                  Text(title, style: TextStyle(color: Colors.grey),),
                  Text(contents),
                ],
              )
            ],
          ),
          UIHelper.verticalSpaceMedium,
          UIHelper.horizontalLine(),
        ],
      ),
    );
  }
}
