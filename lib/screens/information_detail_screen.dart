import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kadina_siddete_hayir/service/informationDetailService.dart';
import 'package:kadina_siddete_hayir/service/informationsService.dart';

class InformationDetailScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return InformationDetailScreenState();

  }

}
class InformationDetailScreenState extends State {
  informationDetailService _informationDetailService = informationDetailService();


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
      stream: _informationDetailService.getInformationDetail(),
      builder: (context, snapshot){
        return !snapshot.hasData
            ? CircularProgressIndicator()
            : ListView.builder(
          itemCount: snapshot.data.docs.length,
          itemBuilder: (context, index){
            DocumentSnapshot mypost = snapshot.data.docs[index];

            return Padding(
              padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        SizedBox(width: 10,),
                        Text("${mypost['textDetail']}"),

                      ],
                    ),
                  ),
                ),
              );
          },
        );
      },
    );
  }
}
