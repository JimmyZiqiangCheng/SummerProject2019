import 'package:flutter/material.dart';
import 'package:project_valkyrie/app/base_view.dart';
import 'package:project_valkyrie/common_widgets/carousel_slider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return 
      ChangeNotifierProvider<ValueNotifier<int>>(
        create: (context) => ValueNotifier<int>(0),
        child: BaseView(bodyWidget: Carousel(), title:'Home'),
      );  
  }
}