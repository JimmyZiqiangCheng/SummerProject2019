import 'dart:core';
import 'package:project_valkyrie/core/services/parcel_service.dart';
import 'package:provider/provider.dart';
import 'package:project_valkyrie/core/data_models/user.dart';
import 'package:project_valkyrie/core/services/authentication_service.dart';
import 'package:project_valkyrie/core/services/firebase_api.dart';
import 'package:project_valkyrie/core/services/notification_service.dart';
import 'package:project_valkyrie/core/services/backend_rest_api.dart';

List<SingleChildCloneableWidget> appProviders = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: FirebaseApi()), Provider.value(value: BackendRestApi()),
];

List<SingleChildCloneableWidget> dependentServices = [
  // provider depend on and the provider service
  ProxyProvider<FirebaseApi, AuthenticationService>(
    update: (context, fireBaseApi, authen) =>
        AuthenticationService(api: fireBaseApi),
  ),
  ProxyProvider<BackendRestApi, ParcelService>(
    update: (context, backendRestApi, parcels) => ParcelService(api: backendRestApi),
  ),
];
List<SingleChildCloneableWidget> uiConsumableProviders = [
  StreamProvider<User>(
    create: (context) =>
        Provider.of<AuthenticationService>(context, listen: false).user,
  ),
  ChangeNotifierProvider<NotificationService>(
    create: (context) => NotificationService()),
];