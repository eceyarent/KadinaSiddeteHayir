

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:kadina_siddete_hayir/screens/add_relatives_screen.dart';
import 'package:kadina_siddete_hayir/service/RelativesService.dart';

class RelativesListScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
      return RelativesListScreenState();

  }

}
class RelativesListScreenState extends State {
  RelativesService _relativesService = RelativesService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Yakınlarım Listesi"),
      ),
      body: buildBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          goToAddRelativesScreen();
        },
        child: Icon(Icons.add),
        tooltip: "Yeni Ürün Ekle",
      ),
    );
  }
  void goToAddRelativesScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AddRelativesScreen()));
  }

  Widget buildBody() {
    return StreamBuilder(
      stream: _relativesService.getRelatives(),
      builder: (context, snapshot){
        return !snapshot.hasData
            ? CircularProgressIndicator()
            : ListView.builder(
          itemCount: snapshot.data.docs.length,
          itemBuilder: (context, index){
            DocumentSnapshot mypost = snapshot.data.docs[index];
            
            Future<void> _showChoiseDialog(BuildContext){
              return showDialog(
                context:context,
                builder:(context){
                  return AlertDialog(
                    title: Text("Silmek istediğinize emin misiniz?"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular((10)))
                    ),
                    content: Container(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => _relativesService.removeRelatives(mypost.id).then((value)=>Navigator.pop(context)),
                              child: Text("Evet  ")),
                          InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Text("Hayır")),
                        ],
                      ),
                    ),
                  );
                }
              );
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => _showChoiseDialog(context),
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
                        CircleAvatar(backgroundColor: Colors.black,child: Text("${mypost['name'][0]}")),
                        SizedBox(width: 10,),
                        Text("${mypost['name']}"),
                        SizedBox(width: 10,),
                        Text("${mypost['surName']}"),
                        SizedBox(width: 10,),
                        Text("${mypost['phoneNumber']}"),
                        SizedBox(width: 10,),
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
}




