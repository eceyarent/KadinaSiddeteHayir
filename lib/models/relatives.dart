import 'package:cloud_firestore/cloud_firestore.dart';

class Relatives{
  String id;
  String name;
  String surName;
  String phoneNumber;

  Relatives({this.id,this.name,this.surName,this.phoneNumber});
  factory Relatives.fromSnapshot(DocumentSnapshot snapshot){
    return Relatives(
      id:snapshot.id,
      name: snapshot["name"],
      surName: snapshot["surName"],
      phoneNumber: snapshot["phoneNumber"],

    );
  }

  Relatives.fromMap(Map<String,dynamic>map)
      : assert(map["name"] != null),
        assert(map["surName"] != null),
        assert(map["phoneNumber"] != null),
        name= map["name"],
        surName=map["surName"],
        phoneNumber=map["phoneNumber"];

}