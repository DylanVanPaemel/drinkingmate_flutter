import 'package:flutter/material.dart';
import '../../model/cafe.dart';
import '../home/CafeRow.dart';
import '../../text_style.dart';

class DetailPage extends StatelessWidget {
  final Cafe cafe;

  DetailPage(this.cafe);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
          constraints: new BoxConstraints.expand(),
          child: new Stack(
            children: <Widget>[
              _getBackground(),
              _getContent(),
              _getToolbar(context),
            ],
          )),
    );
  }

  Container _getBackground() {
    return new Container(
      decoration: new BoxDecoration(
        color: Colors.blueGrey[900]
      ),
      constraints: new BoxConstraints.expand(height: 800.0),
    );
  }

  

  Widget _getContent() {
    final _overviewTitle = "Details".toUpperCase();
    return new ListView(
      padding: new EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
      children: <Widget>[
        new CafeRow(
          cafe,
          horizontal: false,
        ),
        new Container(
          padding: new EdgeInsets.symmetric(horizontal: 32.0),
          decoration: new BoxDecoration(
            color: Colors.blueGrey[900]
          ),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(
                _overviewTitle,
                style: new TextStyle(color: Colors.tealAccent),
              ),
              new Separator(),
              new Text(cafe.beschrijving, style: Style.commonTextStyle),
            ],
          ),
        ),
      ],
    );
  }

  Container _getToolbar(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: new BackButton(color: Colors.tealAccent),
    );
  }
}

class Separator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: new EdgeInsets.symmetric(vertical: 8.0),
        height: 2.0,
        width: 18.0,
        color: new Color(0xFF263238));
  }
}
