import 'package:cloud_firestore/cloud_firestore.dart';

class Informations{
  String id;
  String Text;
  String textDetail;


  Informations({this.id,this.Text,this.textDetail});
  factory Informations.fromSnapshot(DocumentSnapshot snapshot){
    return Informations(
        id:snapshot.id,
        Text: snapshot["Text"],
        textDetail: snapshot["textDetail"]

    );
  }
}