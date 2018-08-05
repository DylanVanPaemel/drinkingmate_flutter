import 'package:drinkingmate_flutter/db/CafeRepository.dart';
import 'package:drinkingmate_flutter/main.dart';
import 'package:drinkingmate_flutter/model/cafe.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:drinkingmate_flutter/db/UserRepository.dart';

class ProfilePage extends StatelessWidget {
  UserRepository userRepository;
  CafeRepository cafeRepository;
  final _formKey = new GlobalKey<FormState>();
  Cafe cafe;

  ProfilePage(this.userRepository);

  @override
  Widget build(BuildContext context) {
    cafeRepository = getCafeRepository();
    setCafeOfUser();
    return new Container(
        padding: EdgeInsets.all(15.0),
        child: new Form(
            key: _formKey,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: profileForm(),
            )));
  }

  List<Widget> profileForm() {
    return [
      new TextFormField(
        initialValue: cafe.naam,
        decoration: new InputDecoration(labelText: 'Cafenaam'),
        validator: (value) => value.isEmpty ? 'Wachtwoord is leeg' : null,
        // onSaved: (value) => _email = value,
      ),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'wachtwoord'),
        obscureText: true,
        validator: (value) => value.isEmpty ? 'Wachtwoord is leeg' : null,
        //onSaved: (value) => _password = value,
      ),
    ];
  }

  Cafe setCafeOfUser() {
    this.cafe = cafeRepository
        .getCafes()
        .firstWhere((cafe) => cafe.email == userRepository.getUser().email);
  }
}
