import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AccountScreenState();
  }

}

class AccountScreenState extends State {
  String mesaj = "Kadına Şiddete Hayır";
  @override
  Widget build(BuildContext context) {

     return Scaffold(
       appBar: AppBar(
         title: Text(mesaj),
       ),
       body: Column(
         children: [
           Expanded(
               child: ListView.builder(
           itemCount: 1,
           itemBuilder: (BuildContext context, int index) {
             return ListTile(
               leading: CircleAvatar(
                 backgroundImage: NetworkImage(
                     "https://cdn.pixabay.com/photo/2017/05/15/21/58/drug-icon-2316244_960_720.png"),
               ),
               title: Text("Minoset"),
               subtitle: Text("Saat 12:00"),
               trailing: Icon(Icons.done),
             );
           })),
         ],
       ),
     );
  }

}