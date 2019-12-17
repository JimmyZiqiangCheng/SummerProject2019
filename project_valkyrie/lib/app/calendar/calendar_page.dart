
import 'package:flutter/material.dart';
import 'package:project_valkyrie/app/base_view.dart';
import 'package:project_valkyrie/common_widgets/calendar.dart';
import 'package:provider/provider.dart';

class CalendarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ValueNotifier<int>>(
      create: (context) => ValueNotifier<int>(2),
      child: BaseView(bodyWidget: Calendar(),title:'Calendar'),
    );
  }
}