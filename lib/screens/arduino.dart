import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:kadina_siddete_hayir/models/relatives.dart';
import 'package:kadina_siddete_hayir/service/geolocatorService.dart';
import 'package:url_launcher/url_launcher.dart';

class name extends StatelessWidget {
  final Widget scaffold;
  const name({Key key, this.scaffold}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dbRef = FirebaseDatabase.instance.ref().child('buttonState');
    return StreamBuilder(
      stream: dbRef.onValue,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data.snapshot.value);

          if (snapshot.data.snapshot.value == '1') {
            _callNumbers();
          } else if (snapshot.data.snapshot.value == '2') {
            sendsms();
          } else if (snapshot.data.snapshot.value == '3') {
            sendsms1();
          } else {
            null;
          }
          return scaffold;
        } else {
          return scaffold;
        }
      },
    );
  }

  void sendsms() async {
    List<Relatives> query = [];
    QuerySnapshot result =
        await FirebaseFirestore.instance.collection("relatives").get();
    query = result.docs.map((e) => Relatives.fromMap(e.data())).toList();
    var number = query[0].phoneNumber;

    String sms1 = "sms:" +
        number +
        "?body=GÜVENDE%20DEĞİLİM%20ACİL%20YARDIMA%20İHTİYACIM%20VAR.";
    launch(sms1);
  }

  void sendsms1() async {
    final geolocatorService = Get.put(GeolocatorService());
    List<Relatives> query = [];
    QuerySnapshot result =
        await FirebaseFirestore.instance.collection("relatives").get();
    query = result.docs.map((e) => Relatives.fromMap(e.data())).toList();
    var number = query[0].phoneNumber;
    Geolocator.requestPermission().then((request) async {
      print("REQUEST : $request");
      if (Platform.isAndroid) {
        if (request != LocationPermission.whileInUse) {
          print("NOT LOCATION PERMISSION");
          return;
        } else {
          print("PERMISSION OK");
          await geolocatorService.permissionOK();
          String sms1 = "sms:" +
              number +
              "?body=https://www.google.com/maps/place/${geolocatorService.currentLocation.latitude},${geolocatorService.currentLocation.longitude}";
          launch(sms1);
        }
      }
    });
  }

  void _callNumbers() async {
    List<Relatives> query = [];
    QuerySnapshot result =
        await FirebaseFirestore.instance.collection("relatives").get();
    query = result.docs.map((e) => Relatives.fromMap(e.data())).toList();

    var number = query[0].phoneNumber;
    bool res = await FlutterPhoneDirectCaller.callNumber(number);
  }
}
