import 'package:flutter/material.dart';
import 'package:project_valkyrie/core/constants/app_constants.dart';
import 'package:project_valkyrie/ui/shared_widgets/my_carousel.dart';
import 'package:project_valkyrie/ui/views/base_views/base_view_with_appbar.dart';


class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseViewWithAppBar(
      model: null,
      child: Carousel(),
      routePath: RoutePaths.home,
      builder: (context, model, child) => child
    );
  }
}