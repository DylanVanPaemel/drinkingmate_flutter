import 'package:flutter/material.dart';
import '../../text_style.dart';
import '../../model/cafe.dart';
import '../detail/DetailPage.dart';

class CafeRow extends StatelessWidget {
  final Cafe cafe;
  final bool horizontal;

  CafeRow(this.cafe, {this.horizontal = true});

  CafeRow.vertical(this.cafe) : horizontal = false;

  @override
  Widget build(BuildContext context) {
    final cafeThumbnail = new Container(
        margin: new EdgeInsets.symmetric(vertical: 16.0),
        alignment:
            horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
        height: 92.0,
        width: 92.0,
        child: new Hero(
            tag: "cafe-hero-${cafe.id}",
            child: new Container(
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    border: new Border.all(width:3.0,color: Colors.tealAccent),
                    image: new DecorationImage(
                        fit: BoxFit.fill, image: new AssetImage(cafe.logo))))));

    Widget _planetValue({String value, String image}) {
      return new Container(
        child: new Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          new Image.asset(image, height: 12.0),
          new Container(width: 8.0),
          new Text("hier nog iets", style: Style.regularTextStyle),
        ]),
      );
    }

    final cafeCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(
          horizontal ? 76.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment:
            horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(
            cafe.naam,
            style: Style.headerTextStyle,
          ),
          new Container(height: 10.0),
          new Text(cafe.regio, style: Style.subHeaderTextStyle),
          new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 200.0,
              color: new Color(0xFF64FFDA)), //Streepje
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                flex: horizontal ? 1 : 0,
                child: new Row(children: <Widget>[
                  new Image.asset("assets/img/ic_distance.png", height: 15.0),
                  new Container(width: 8.0),
                  new Text("0.6969 km", style: Style.regularTextStyle),
                ]),
              ),
              new Expanded(
                child: new Row(children: <Widget>[
                  new Image.asset("assets/img/ic_gravity.png", height: 15.0),
                  new Container(width: 8.0),
                  new Text("hier nog iets", style: Style.regularTextStyle),
                ]),
              )
            ],
          ),
        ],
      ),
    );

    final cafeCard = new Container(
      child: cafeCardContent,
      height: horizontal ? 124.0 : 154.0,
      margin: horizontal
          ? new EdgeInsets.only(left: 46.0)
          : new EdgeInsets.only(top: 72.0),
      decoration: new BoxDecoration(
        color: new Color(0xFF263238),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );

    return new GestureDetector(
         onTap: horizontal
         ? () => Navigator.of(context).push(
           new PageRouteBuilder(
             pageBuilder: (_, __, ___) => new DetailPage(cafe),
             transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              new FadeTransition(opacity: animation, child: child),
             ) ,
           )
         : null,
        child: new Container(
          margin: const EdgeInsets.only(
            top: 16.0,
            bottom: 16.0,
            left: 20.0,
            right: 20.0,
          ),
          child: new Stack(
            children: <Widget>[
              cafeCard,
              cafeThumbnail,
            ],
          ),
        ));
  }
}
