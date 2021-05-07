//import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kadina_siddete_hayir/models/relatives.dart';


class RelativesService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //veri ekleme fonksiyonu
  Future<void>addRelatives(String name,String surName,String phoneNumber) async{
    var ref = _firestore.collection("relatives");

    var documentRef = await ref.add({
     'name': name,
      'surName':surName,
      'phoneNumber': phoneNumber,
    });

    return Relatives(id:documentRef.id,name:name, surName:surName,phoneNumber:phoneNumber);
  }

  //veri gösterme fonksiyonu

    Stream<QuerySnapshot> getRelatives(){
    var ref = _firestore.collection("relatives").snapshots();

    return ref;
    }

   //silme fonsksiyonu
    Future<void> removeRelatives(String docId){
    var ref = _firestore.collection("relatives").doc(docId).delete();
    return ref;
    }
}