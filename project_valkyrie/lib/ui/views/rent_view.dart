import 'package:flutter/material.dart';
import 'package:project_valkyrie/core/constants/app_constants.dart';
import 'package:project_valkyrie/ui/views/base_views/base_view_with_appbar.dart';


class RentView extends StatelessWidget {
  const RentView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseViewWithAppBar(
      model: null,
      child: Text('rent page'),
      routePath: RoutePaths.rent,
      builder: (context, model, child) => child
    );
  }
}