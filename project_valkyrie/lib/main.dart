import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_valkyrie/providers.dart';
import 'package:project_valkyrie/ui/router.dart';
import 'package:project_valkyrie/ui/styles/app_colors.dart';
import 'package:provider/provider.dart';



import 'core/constants/app_constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(

          // statusBarColor is used to set Status bar color in Android devices.
          statusBarColor: AppColors.primaryTint,

          // To make Status bar icons color white in Android devices.
          statusBarIconBrightness: Brightness.dark,

          // statusBarBrightness is used to set Status bar icon color in iOS.
          statusBarBrightness: Brightness.dark
          // Here light means dark color Status bar icons.

          ),
    );
    return MultiProvider(
      providers: appProviders,
      child: MaterialApp(
        title: 'VALKYRIE',
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          primaryColorDark: AppColors.primaryDark,
          primaryColorLight: AppColors.primaryTint,
          accentColor: AppColors.primaryColor,
          fontFamily: 'Montserrat',
        ),
        initialRoute: RoutePaths.welcome,
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
