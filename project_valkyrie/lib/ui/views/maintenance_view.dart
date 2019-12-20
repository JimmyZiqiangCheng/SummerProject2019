import 'package:flutter/material.dart';
import 'package:project_valkyrie/core/constants/app_constants.dart';
import 'package:project_valkyrie/ui/views/base_views/base_view_with_appbar.dart';

class MaintenanceView extends StatelessWidget {
  const MaintenanceView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseViewWithAppBar(
      model: null,
      child: Text('rent page'),
      routePath: RoutePaths.maintenance,
      builder: (context, model, child) => child
    );
  }
}