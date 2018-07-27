import 'package:drinkingmate_flutter/model/cafe.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class CafeRepository {
  DatabaseReference itemRef;
  List<Cafe> cafes = List();
 
  void initState() {
    final FirebaseDatabase database = FirebaseDatabase.instance;
    itemRef = database.reference().child('cafes');
    itemRef.onChildAdded.listen(_onEntryAdded);
    //itemRef.onChildChanged.listen(_onEntryChanged);
  }

  _onEntryAdded(Event event) {
    cafes.add(Cafe.fromSnapshot(event.snapshot));
  }

  getCafes() {
    return cafes;
  }
}
