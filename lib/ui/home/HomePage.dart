import 'package:drinkingmate_flutter/db/CafeRepository.dart';
import 'package:flutter/material.dart';
import 'GradientAppBar.dart';
import 'HomePageBody.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
   CafeRepository cafeRepository = new CafeRepository();
  bool _isLoading;

  @override
  void initState() {
    super.initState();
    cafeRepository.initState();
    _isLoading = true;
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: new Column(
          children: <Widget>[
            new GradientAppBar("In de buurt..."),
            getDataOrLoading()
          ],
        ));
  }
 Future _loadData() async{
   await new Future.delayed(new Duration(seconds: 1));
   _dataLoaded();

 }

 void _dataLoaded(){
   setState(() {
        _isLoading = false;
      });
 }
  getDataOrLoading() {
    if (_isLoading == true) {
      return new Container();
    } else {
      return new HomePageBody(cafeRepository);
    }
  }
}
