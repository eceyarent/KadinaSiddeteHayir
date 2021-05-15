import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kadina_siddete_hayir/screens/information_detail_screen.dart';
import 'package:kadina_siddete_hayir/service/informationsService.dart';



class InformationScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return InformationScreenState();

  }

}
class InformationScreenState extends State {
  informationsService _informationService = informationsService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Önemli Bilgiler"),
      ),
      body: buildBody(),

    );
  }

  Widget buildBody() {
    return StreamBuilder(
      stream: _informationService.getInformations("textDetail"),
      builder: (context, snapshot){
        return !snapshot.hasData
            ? CircularProgressIndicator()
            : ListView.builder(
          itemCount: snapshot.data.docs.length,
          itemBuilder: (context, index){
            DocumentSnapshot mypost = snapshot.data.docs[index];

            return Padding(
              padding: const EdgeInsets.all(8.0),
            child: InkWell(
            onTap: () {goToInformationDetailScreen(mypost);},
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.deepPurple,width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        SizedBox(width: 10,),
                        Text("${mypost['Text']}"),

                      ],
                    ),
                  ),
                ),
               ),
              );
          },
        );
      },
    );
  }

  void goToInformationDetailScreen(DocumentSnapshot mypost) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => InformationDetailScreen(mypost)));
  }


}
