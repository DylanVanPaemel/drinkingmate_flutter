import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_database/firebase_database.dart';


class Cafe {
  final int id;
  final String naam;
  final String regio;
  final CachedNetworkImageProvider logo;
  final String beschrijving;

  const Cafe({
    this.id,
    this.naam,
    this.regio,
    this.beschrijving,
    this.logo,
  });

  Cafe.fromSnapshot(DataSnapshot snapshot)
      : id = snapshot.value["id"],
        naam = snapshot.value["naam"],
        regio = snapshot.value["regio"],
        logo = new CachedNetworkImageProvider(snapshot.value["logo"]),
        beschrijving = snapshot.value["beschrijving"];
}

 List<Cafe> cafes = [];
  
