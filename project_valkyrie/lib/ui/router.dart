import 'package:flutter/material.dart';
import 'package:project_valkyrie/core/constants/app_constants.dart';
import 'package:project_valkyrie/ui/views/calendar_view.dart';
import 'package:project_valkyrie/ui/views/home_view.dart';
import 'package:project_valkyrie/ui/views/log_in_view.dart';
import 'package:project_valkyrie/ui/views/lost_keys_view.dart';
import 'package:project_valkyrie/ui/views/maintenance_view.dart';
import 'package:project_valkyrie/ui/views/parcel_view.dart';
import 'package:project_valkyrie/ui/views/rent_view.dart';
import 'package:project_valkyrie/ui/views/sign_up_view.dart';
import 'package:project_valkyrie/ui/views/welcome_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.welcome:
        return MaterialPageRoute(builder: (_) => WelcomeView());
      case RoutePaths.login:
        return MaterialPageRoute(builder: (_) => LoginView());
      case RoutePaths.signup:
        return MaterialPageRoute(builder: (_) => SignupView());
      case RoutePaths.home:
        //return MaterialPageRoute(builder: (_) => HomeView());
        return MaterialPageRoute(builder: (_) => HomeView());
      case RoutePaths.calendar:
        // return MaterialPageRoute(builder: (_) => CalendarView());
        return MaterialPageRoute(builder: (_) => CalendarView());
      case RoutePaths.parcel:
        // return MaterialPageRoute(builder: (_) => ParcelView());
        return MaterialPageRoute(builder: (_) => ParcelView());
      case RoutePaths.lostKeys:
        // return MaterialPageRoute(builder: (_) => LostKeysView());
        return MaterialPageRoute(builder: (_) => LostKeysView());
      case RoutePaths.maintenance:
        return MaterialPageRoute(builder: (_) => MaintenanceView());
      case RoutePaths.rent:
        return MaterialPageRoute(builder: (_) => RentView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
