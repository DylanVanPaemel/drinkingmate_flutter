import 'package:drinkingmate_flutter/model/cafe.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CafeRepository {
  DatabaseReference itemRef;
  List<Cafe> cafes = List();
   var cacheManager;
 
  void initState() {
    cacheManager = CacheManager.getInstance();
    CacheManager.maxNrOfCacheObjects = 200;
    final FirebaseDatabase database = FirebaseDatabase.instance;
    itemRef = database.reference().child('cafes');
    itemRef.onChildAdded.listen(_onEntryAdded);
  }

  _onEntryAdded(Event event) {
    cafes.add(Cafe.fromSnapshot(event.snapshot));
  }

  getCafes() {
    return cafes;
  }
}
