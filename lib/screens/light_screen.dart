import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flashlight/flutter_flashlight.dart';
import 'package:kadina_siddete_hayir/service/RelativesService.dart';

class LightScreenScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LightScreenState();
  }
}

class LightScreenState extends State {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("El Feneri"),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Center(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 150),
            child: Center(
              child: Transform.rotate(
                angle: -3.14 / 2,
                child: Transform.scale(
                  scale: 3,
                  child: Switch(
                      inactiveThumbColor: Colors.black,
                      activeColor: Colors.deepPurple,
                      value: isON,
                      onChanged: (value) {
                        setState(() {
                          isON = !isON;
                          isON ? Flashlight.lightOn() : Flashlight.lightOff();
                        });
                      }),
                ),
              ),
            ),
          ),
          SizedBox(height: 100,),
          SizedBox(
            width: 150,
            height: 150,
            child: RaisedButton(
              child: Text("S. O. S.",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              shape: CircleBorder(side: BorderSide.none),
              color: Colors.red,
              onPressed: (){sosFlashLight();},
            ),
          )
        ],
      ),
    );
  }

  void sosFlashLight() {
    for (int i = 0; i < 50; i++) {
      Flashlight.lightOn();
      for(int j = 0; j < 50; j++){
        Flashlight.lightOff();
      }
    }
  }
}
