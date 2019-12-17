import 'package:flutter/material.dart';
import 'package:project_valkyrie/app/base_view.dart';
import 'package:provider/provider.dart';

class ParcelPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ValueNotifier<int>>(
      create: (context) => ValueNotifier<int>(1),
      child: BaseView(bodyWidget: Text('parcel collection page'),title:'Parcel'),
    );
  }
}