import 'package:flutter/material.dart';
import 'package:kadina_siddete_hayir/screens/account_screen.dart';
import 'package:kadina_siddete_hayir/screens/information_screen.dart';
import 'package:kadina_siddete_hayir/screens/relatives_list_screen.dart';

class HomePageScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomePageScreenState();
  }


}
enum Options { Hesabim }
class HomePageScreenState extends State {
  String mesaj = "Kadına Şiddete Hayır";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [PopupMenuButton<Options>(
          onSelected: selectProcess,
          itemBuilder: (BuildContext context) =>
          <PopupMenuEntry<Options>>[
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
              padding: const EdgeInsets.all(50.0),
              child:IconButton(
                icon: Icon(Icons.security, color: Colors.black,size: 100.0,),
                highlightColor: Colors.deepPurple,
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(90.0),
                child: IconButton(
                  icon: Icon(Icons.location_on, color: Colors.black,size: 100.0,),
                  highlightColor: Colors.deepPurple,
                  onPressed: () {},
              ),
            )
          ],
        ),
        Expanded(
          child: Center(
            child: SizedBox(
              height: 100.0,
              width: 100.0,
              child: IconButton(
                padding: EdgeInsets.all(0.0),
                icon: Icon(Icons.volume_up, color: Colors.black, size: 100.0,),
                highlightColor: Colors.deepPurple,
                onPressed: () {},
              ),
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child:IconButton(
               icon: Icon(Icons.message, color: Colors.black,size: 100.0,),
                highlightColor: Colors.deepPurple,
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(90.0),
              child:IconButton(
                icon: Icon(Icons.add_call, color: Colors.black,size: 100.0,),
                highlightColor: Colors.deepPurple,
                onPressed: () {},
              ),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.deepPurple,
                child: Row(
                  children: [
                    Icon(Icons.account_circle_outlined, color: Colors.white,),
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
                  return Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RelativesListScreen()));

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
                    Icon(Icons.article_outlined, color: Colors.white,),
                    SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      children: [
                        Text("Önemli ", style: TextStyle(color: Colors.white)),
                        Text("Bilgiler", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
                onPressed: () {
                  return Navigator.push(context,
                      MaterialPageRoute(builder: (context) => InformationScreen()));

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
                    Icon(Icons.accessibility_new, color: Colors.white,),
                    SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      children: [
                        Text("Savunma", style: TextStyle(color: Colors.white)),
                        Text("Sanatları", style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ],
                ),
                onPressed: () {

                },
              ),
            ),
          ],
        )
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
}


