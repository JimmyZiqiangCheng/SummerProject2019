import 'package:flutter/material.dart';

class AddListItem extends StatelessWidget {

  final void Function() onTap;
  AddListItem({@required this.onTap});

  @override
  Widget build(BuildContext context) {
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
          onTap: onTap),
    );
  }
}