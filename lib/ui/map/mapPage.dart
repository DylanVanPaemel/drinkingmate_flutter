import 'package:drinkingmate_flutter/ui/map/GradientAppBar.dart';
import 'package:flutter/material.dart';

class Map extends StatelessWidget{
 @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
          constraints: new BoxConstraints.expand(),
          child: new Stack(
            children: <Widget>[
              _getToolbar(context),
            ],
          )),
    );
  }

    Container _getToolbar(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child:new Row( 
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
         new CloseButton(),

      ],),
    );
  }
}