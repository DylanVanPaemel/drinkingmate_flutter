import 'package:drinkingmate_flutter/db/CafeRepository.dart';
import 'package:flutter/material.dart';
import 'ui/home/HomePage.dart' as home;
import 'ui/map/mapPage.dart' as map;
import 'ui/profile/profilePage.dart' as profile;

void main() {
  runApp(new MaterialApp(
    title: "drinkingmate",
    home: new MyTabs(),
    routes: <String, WidgetBuilder>{
      'ui/map/mapPage.dart': (BuildContext context) => new map.Map(),
    },
  ));
}

class MyTabs extends StatefulWidget {
  @override
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void openMap(BuildContext context) {
    Navigator.of(context).pushNamed('ui/map/mapPage.dart');
  }

  @override
  Widget build(BuildContext context) {
    CafeRepository cafeRepository = new CafeRepository();
    cafeRepository.initState();
    return new Scaffold(
       backgroundColor: Colors.blueGrey[900],
         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
              Icon(Icons.map, size: 35.0,),
              //new Text("Kaart"),
            ],),
            backgroundColor: Colors.white,
            foregroundColor: Colors.blueGrey[900],
            onPressed: () {
              openMap(context);
            }),
        bottomNavigationBar: BottomAppBar(
            //shape: CircularNotchedRectangle(),
            child: new Container(
              child: new Material(
                color: const Color(0xFF64FFDA),
                child: new TabBar(
                    indicatorColor: Colors.white,
                    controller: controller,
                    labelColor: Colors.blueGrey[900],
                    unselectedLabelColor: Colors.teal[55],
                    tabs: <Tab>[
                      new Tab(
                          child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[Icon(Icons.home), Text(" ACTIES")],
                      )),
                      new Tab(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.person_pin),
                            Text(" PROFIEL")
                          ],
                        ),
                      )
                    ]),
              ),
            )),
        body: new TabBarView(
          controller: controller,
          children: <Widget>[
            new home.HomePage(cafeRepository),
            new profile.Profile()
          ],
        ));
  }
}
