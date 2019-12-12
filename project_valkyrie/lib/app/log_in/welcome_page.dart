import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Login Demo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            onPressed: (){
              Navigator.of(context).pushNamed(
                '/login'
              );
            },
            child: Text("Log in"),
          ),
          RaisedButton(
            onPressed: (){
              Navigator.of(context).pushNamed(
                  '/signup'
              );
            },
            child: Text("Sign up"),
          ),
        ],
      ),
    );
  }
}
