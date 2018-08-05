import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_database/firebase_database.dart';


class Cafe {
  final int id;
  final String naam;
  final String regio;
  final CachedNetworkImageProvider logo;
  final String beschrijving;
  final List<String> activiteiten;
  final String email;

  const Cafe({
    this.id,
    this.naam,
    this.regio,
    this.beschrijving,
    this.logo,
    this.activiteiten,
    this.email
  });

  Cafe.fromSnapshot(DataSnapshot snapshot)
      : id = snapshot.value["id"],
        naam = snapshot.value["naam"],
        regio = snapshot.value["regio"],
        logo = new CachedNetworkImageProvider(snapshot.value["logo"]),
        beschrijving = snapshot.value["beschrijving"],
        activiteiten = new List<String>.from(snapshot.value["activiteiten"]),
        email = snapshot.value["email"];
}

 List<Cafe> cafes = [];
  
