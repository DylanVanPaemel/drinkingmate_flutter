import 'package:drinkingmate_flutter/db/CafeRepository.dart';
import 'package:flutter/material.dart';
import 'GradientAppBar.dart';
import 'HomePageBody.dart';

class HomePage extends StatelessWidget {

  final CafeRepository cafeRepository;

  const HomePage(this.cafeRepository);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Column(
      children: <Widget>[
        new GradientAppBar("In de buurt..."),
        new HomePageBody(this.cafeRepository)
      ],
    ));
  }
}
