import 'package:cloud_firestore/cloud_firestore.dart';

class Relatives{
  String id;
  String name;
  String surName;
  String phoneNumber;
  String image;

  Relatives({this.id,this.name,this.surName,this.phoneNumber,this.image});
  factory Relatives.fromSnapshot(DocumentSnapshot snapshot){
    return Relatives(
      id:snapshot.id,
      name: snapshot["name"],
      surName: snapshot["surName"],
      phoneNumber: snapshot["phoneNumber"],
      image: snapshot["image"]
    );
  }
}