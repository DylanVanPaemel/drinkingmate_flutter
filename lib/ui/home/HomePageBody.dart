import 'package:flutter/material.dart';
import 'package:drinkingmate_flutter/ui/home/CafeRow.dart';
import 'package:drinkingmate_flutter/model/cafe.dart';

class HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Container(
        color: Colors.blueGrey[900],
        child: new CustomScrollView(
          scrollDirection: Axis.vertical,
          shrinkWrap: false,
          slivers: <Widget>[
            new SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 0.0),
              sliver: new SliverList(
                delegate: new SliverChildBuilderDelegate(
                    (context, index) => new CafeRow(cafes[index]),
                  childCount: cafes.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}