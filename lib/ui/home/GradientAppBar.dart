import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget {

  final String title;
  final double barHeight = 40.0;

  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery
      .of(context)
      .padding
      .top;

    return new Container(
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + barHeight,
      child: new Center(
        child: new Text(title,
          style:const TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 30.0
          ),
        ),
      ),
      decoration: new BoxDecoration(
        color: const Color(0xFF64FFDA)
      ),
    );
  }
}