import 'dart:async';

import 'package:drinkingmate_flutter/db/UserRepository.dart';
import 'package:drinkingmate_flutter/ui/profile/GradientAppBar.dart';
import 'package:drinkingmate_flutter/ui/profile/ProfilePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({this.userRepository});

  final UserRepository userRepository;

  @override
  State<StatefulWidget> createState() => new _ProfileState(this.userRepository);
}

class _ProfileState extends State<Profile> {
  _ProfileState(this.userRepository);
  String _email;
  String _password;
  UserRepository userRepository;
  bool isLoggedIn;
  final _formKey = new GlobalKey<FormState>();
  bool isLoggingIn;

  @override
  void initState() {
    if (this.mounted) {
      super.initState();
      if (userRepository.getUser() != null) {
        isLoggedIn = true;
      } else {
        isLoggedIn = false;
      }
      isLoggingIn = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.blueGrey[900],
        resizeToAvoidBottomPadding: false,
        body: new Column(
          children: <Widget>[
            new GradientAppBar("Mijn Profiel"),
            new Container(
                padding: EdgeInsets.all(15.0),
                child: new Form(
                    key: _formKey,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: LoginFormOrProfile(),
                    ))),
            loadingSpinner(),
          ],
        ));
  }

  List<Widget> LoginFormOrProfile() {
    if (isLoggedIn) {
      return [new ProfilePage()];
    } else {
      return [
        new TextFormField(
          decoration: new InputDecoration(labelText: 'E-mailadres'),
          validator: (value) =>
              validEmail(value) ? null : 'Geen geldig E-mailadres',
          onSaved: (value) => _email = value,
        ),
        new TextFormField(
          decoration: new InputDecoration(labelText: 'wachtwoord'),
          obscureText: true,
          validator: (value) => value.isEmpty ? 'Wachtwoord is leeg' : null,
          onSaved: (value) => _password = value,
        ),
        new Padding(
          padding: EdgeInsets.all(10.0),
        ),
        new RaisedButton(
          child: new Text(
            "Inloggen",
            style: new TextStyle(fontSize: 20.0),
          ),
          onPressed: validateAndSubmit,
        )
      ];
    }
  }

  Widget loadingSpinner() {
    if (isLoggingIn) {
      return new Center(child: CircularProgressIndicator());
    } else {
      return new Container();
    }
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      if (this.mounted) {
        setState(() {
          isLoggingIn = true;
        });
      }
      userRepository.login(_email, _password);
      await new Future.delayed(new Duration(seconds: 4));
      if (userRepository.getUser() != null) {
        if (this.mounted) {
          setState(() {
            isLoggedIn = true;
            isLoggingIn = false;
          });
        }
      }
    }
  }

  validEmail(value) {
    String regex =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(regex);

    return regExp.hasMatch(value);
  }
}
