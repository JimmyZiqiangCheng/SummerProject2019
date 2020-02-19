import 'package:flutter/material.dart';
import 'package:project_valkyrie/core/constants/app_constants.dart';
import 'package:project_valkyrie/ui/shared_widgets/my_calendar.dart';
import 'package:project_valkyrie/ui/views/base_views/base_view_with_appbar.dart';


class CalendarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseViewWithAppBar(
      model: null,
      child: Calendar(),
      routePath: RoutePaths.calendar,
      builder: (context, model, child) => child,
    );
  }
}