import 'package:drinkingmate_flutter/db/UserRepository.dart';
import 'package:drinkingmate_flutter/ui/profile/GradientAppBar.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ProfileState();
}

class _ProfileState extends State<Profile> {

  UserRepository userRepository;
  final formKey = new GlobalKey<FormState>();
  String _email;
  String _password;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } 
    return false;
  }

  void validateAndSubmit(){
    if(validateAndSave()){
        userRepository.login(_email, _password);
    }
  }

  @override
  Widget build(BuildContext context) {

    if (userRepository == null){
      userRepository = new UserRepository();
    }

    return new Scaffold(
        backgroundColor: Colors.blueGrey[900],
        resizeToAvoidBottomPadding: false,
        body: new Column(
          children: <Widget>[
            new GradientAppBar("Mijn Profiel"),
            _getLoginForm(),
          ],
        ));
  }

  _getLoginForm() {
    return new Container(
        padding: EdgeInsets.all(15.0),
        child: new Form(
            key: formKey,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new TextFormField(
                  decoration: new InputDecoration(labelText: 'E-mailadres'),
                  validator: (value) =>
                      validEmail(value) ? null: 'Geen geldig E-mailadres' ,
                  onSaved: (value) => _email = value,
                ),
                new TextFormField(
                  decoration: new InputDecoration(labelText: 'wachtwoord'),
                  obscureText: true,
                  validator: (value) =>
                      value.isEmpty ? 'Wachtwoord is leeg' : null,
                  onSaved:  (value) => _password = value,
                ),
                new Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text(
                    "Inloggen",
                    style: new TextStyle(fontSize: 20.0),
                  ),
                  onPressed: validateAndSave,
                )
              ],
            )));
  }

  validEmail(value) {
    String regex =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(regex);


    return regExp.hasMatch(value);
  }
}
