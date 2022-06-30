import 'package:firebase_database/firebase_database.dart';

class Need {
  final String id;
  final String lat;
  final String long;
  final String state;

  Need({
    required this.id,
    required this.lat,
    required this.long,
    required this.state,
  });

/*  Need.fromSnapshot(DataSnapshot snapshot, this.lat, this.long, this.state) :
        id = snapshot.key,
        imageUrl = snapshot.value["lat"],
        caption = snapshot.value["long"],
        title = snapshot.value["state"];*/

  toJson() {
    return {
      "lat": lat,
      "long": long,
      "state": state,
    };
  }
}