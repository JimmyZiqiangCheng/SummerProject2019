import 'dart:core';
import 'package:provider/provider.dart';
import 'package:project_valkyrie/core/data_models/user.dart';
import 'package:project_valkyrie/core/services/authentication_service.dart';
import 'package:project_valkyrie/core/services/firebase_api.dart';
import 'package:project_valkyrie/core/services/notification_service.dart';

List<SingleChildCloneableWidget> appProviders = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];
List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: FirebaseApi()),
];

List<SingleChildCloneableWidget> dependentServices = [
  // provider depend on and the provider service
  ProxyProvider<FirebaseApi, AuthenticationService>(
    update: (context, fireBaseApi, authen) =>
        AuthenticationService(api: fireBaseApi),
  )
];
List<SingleChildCloneableWidget> uiConsumableProviders = [
  StreamProvider<User>(
    create: (context) =>
        Provider.of<AuthenticationService>(context, listen: false).user,
  ),
  ChangeNotifierProvider<NotificationService>(
    create: (context) => NotificationService()),
];