import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  bool _autoValidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: loginForm(),
    );
  }

  Widget loginForm() {
    return Form(
      key: _formKey,
      autovalidate: _autoValidate,
      child: Column(
        children: [
          TextFormField(
            validator: (input) {
              if (!isEmail(input)) {
                return 'Invalid email address';
              }
              return null;
            },
            onSaved: (input) => _email = input,
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Please enter an email',
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          TextFormField(
            validator: (input) {
              if (input.length < 6) {
                return 'Password cannot be less than 6 characters.';
              }
              return null;
            },
            onSaved: (input) => _password = input,
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'your password should be at least 6 charactors long',
            ),
          ),
          RaisedButton(
            onPressed: signIn,
            child: Text("Log in"),
          ),
        ],
      ),
    );
  }

  Future<void> signIn() async {
    final _formState = _formKey.currentState;

    if (_formState.validate()) {
      _formState.save();
      try {
        AuthResult result = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        FirebaseUser user = result.user;
        Navigator.of(context).pushNamed('/home', arguments: user);
      } catch (e) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: new Text('wrong username or password'),
          duration: new Duration(seconds: 3),
          backgroundColor: Colors.green,
        ));
      }
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
