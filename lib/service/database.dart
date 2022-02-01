import 'package:firebase_database/firebase_database.dart';
import 'package:kadina_siddete_hayir/models/relatives.dart';

final databaseReference = FirebaseDatabase.instance.reference();

DatabaseReference saveRelatives(Relatives relatives) {
  var id = databaseReference.child('relatives/').push();
  id.set(relatives.toJson());
  return id;



  
}

