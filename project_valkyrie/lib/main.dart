import 'package:flutter/material.dart';
import 'package:project_valkyrie/app/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Authentication and Authorization Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        canvasColor: Colors.grey[50],
      ),
      initialRoute: '/',
      onGenerateRoute: Router.generateRoute,
    );
  }
}
