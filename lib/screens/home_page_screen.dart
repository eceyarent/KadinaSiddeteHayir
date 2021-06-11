import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_flashlight/flutter_flashlight.dart';
import 'package:kadina_siddete_hayir/models/relatives.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:kadina_siddete_hayir/screens/account_screen.dart';
import 'package:kadina_siddete_hayir/screens/information_screen.dart';
import 'package:kadina_siddete_hayir/screens/relatives_list_screen.dart';
import 'package:kadina_siddete_hayir/screens/video_screen.dart';
import 'package:kadina_siddete_hayir/service/geolocatorService.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
class HomePageScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageScreenState();
  }
}

enum Options { Hesabim }

class HomePageScreenState extends State {
  final geolocatorService = Get.put(GeolocatorService());
  final player = AudioCache();
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("$command bulunamadı");
    }
  }
  var _hasFlashlight = false;
  var isON = false;

  checkLight() async {
    bool hasFlash = await Flashlight.hasFlashlight;
    setState(() {
      _hasFlashlight = hasFlash;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLight();



  }

  String mesaj = "Kadına Şiddete Hayır";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<Options>(
            onSelected: selectProcess,
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Options>>[
              PopupMenuItem(
                value: Options.Hesabim,
                child: Text("Hesabım"),
              ),
            ],
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text(mesaj, style: TextStyle(color: Colors.white)),
      ),
      body: buildBody(context),
    );
  }

  buildBody(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80, bottom: 60, left: 52),
              child: Column(
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.local_police_outlined,
                                size: 100.0, color: Colors.black),
                            highlightColor: Colors.deepPurple,
                            onPressed: _callNumber,

                          ),
                        ],
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.location_on,
                              color: Colors.black,
                              size: 100.0,
                            ),
                            highlightColor: Colors.deepPurple,
                            onPressed: () {
                              sendsms1();
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.volume_up,
                              size: 100.0,
                              color: Colors.black,
                            ),
                            highlightColor: Colors.deepPurple,
                            onPressed: () {
                              player.play(
                                  'Polis Siren Sesi (Uzun 10 dk.) (mp3cut.net) (1).wav');
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 150,
                      ),
                    Container(

                      child: Center(
                        child: Transform.rotate(
                            angle: -3.14/ 2,
                          child: Transform.scale(
                              scale: 2.5,
                            child: Switch(
                              inactiveThumbColor: Colors.black,
                              activeColor: Colors.deepPurple,
                              value: isON ,
                              onChanged: (value){
                                setState(() {
                                  isON=!isON;
                                  isON? Flashlight.lightOn() : Flashlight.lightOff();
                                });

                            }
                            ),



                          ),

                        ),
                      ),
                    )
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.message,
                              color: Colors.black,
                              size: 100.0,
                            ),
                            highlightColor: Colors.deepPurple,
                            onPressed: () {
                              sendsms();
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.add_call,
                              color: Colors.black,
                              size: 100.0,
                            ),
                            highlightColor: Colors.deepPurple,
                            onPressed: _callNumbers,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 71),
          child: Row(
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                  color: Colors.deepPurple,
                  child: Row(
                    children: [
                      Icon(
                        Icons.account_circle_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        children: [
                          Text("Yakınlarım",
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                  onPressed: () {
                    return Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RelativesListScreen()));
                  },
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                  color: Colors.deepPurple,
                  child: Row(
                    children: [
                      Icon(
                        Icons.article_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        children: [
                          Text("Önemli ",
                              style: TextStyle(color: Colors.white)),
                          Text("Bilgiler",
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                  onPressed: () {
                    return Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InformationScreen()));
                  },
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                  color: Colors.deepPurple,
                  child: Row(
                    children: [
                      Icon(
                        Icons.accessibility_new,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        children: [
                          Text("Kendini ",
                              style: TextStyle(color: Colors.white)),
                          Text("Koru !", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                  onPressed: () {
                    return Navigator.push(context,
                        MaterialPageRoute(builder: (context) => VideoScreen()));
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void selectProcess(Options options) {
    switch (options) {
      case Options.Hesabim:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AccountScreen()));
        break;
      default:
    }
  }


  void _callNumber() async{
    const number = '+90-112'; //set the number here
    bool res = await FlutterPhoneDirectCaller.callNumber(number);

  }

  void _callNumbers() async{
      List<Relatives> query = [];
      QuerySnapshot result = await FirebaseFirestore.instance.collection("relatives").get();
      query = result.docs.map((e) => Relatives.fromMap(e.data())).toList();

      var number = query[0].phoneNumber;
      bool res = await FlutterPhoneDirectCaller.callNumber(number);
  }
}

void sendsms() async{
  List<Relatives> query = [];
  QuerySnapshot result = await FirebaseFirestore.instance.collection("relatives").get();
  query = result.docs.map((e) => Relatives.fromMap(e.data())).toList();
  var number = query[0].phoneNumber;

  String sms1 = "sms:"+number+"?body=Deneme%20mesajı";
  launch(sms1);

}

void sendsms1() async{
  final geolocatorService = Get.put(GeolocatorService());
  List<Relatives> query = [];
  QuerySnapshot result = await FirebaseFirestore.instance.collection("relatives").get();
  query = result.docs.map((e) => Relatives.fromMap(e.data())).toList();
  var number = query[0].phoneNumber;
  Geolocator.requestPermission().then((request) {
    print("REQUEST : $request");
    if (Platform.isAndroid) {
      if (request != LocationPermission.always) {
        print("NOT LOCATION PERMISSION");
        return;
      } else {
        print("PERMISSION OK");
        geolocatorService.permissionOK();
        String sms1="sms:"+number+"?body=x: ${geolocatorService.currentLocation.latitude}, y: ${geolocatorService.currentLocation.longitude}";
        launch(sms1);
      }
    }
  });

}


