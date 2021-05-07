import 'package:flutter/material.dart';
import 'package:kadina_siddete_hayir/screens/relatives_list_screen.dart';
import 'package:kadina_siddete_hayir/service/RelativesService.dart';

class AddRelativesScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_AddRelativesScreenState();

  }

class _AddRelativesScreenState extends State<AddRelativesScreen> {
  TextEditingController relativesController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  RelativesService _relativesService = RelativesService();


  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Kişi Ekle"),
      ),
      body:SingleChildScrollView(
        padding: EdgeInsets.all(30.0),
        child:Column(
          children: <Widget>[
            buildNameField(),buildSurNameField(),buildPhoneNumberField(),buildAddButton()
          ],
        ),
      )
    );
  }

  buildNameField(){
    return TextField(
      controller: _nameController,
      decoration: InputDecoration(labelText: "İsim"),
    );
  }

  buildSurNameField(){
    return TextField(
      controller: _surNameController,
      decoration: InputDecoration(labelText: "Soyisim"),
    );
  }

  buildPhoneNumberField() {
    return TextField(
      controller: _phoneNumberController,
      decoration: InputDecoration(labelText: "Telefon Numarası"),
    );
  }

  buildAddButton() {
    return SizedBox(
      child: RaisedButton(
          child: Text("Ekle" , style: TextStyle(color:Colors.white)),
          color: Colors.deepPurple,
          elevation: 4.0,
          splashColor: Colors.grey,
          onPressed: () {
            goToRelativesListScreen();

          }
      ),
    );
  }

  void goToRelativesListScreen() {
    _relativesService.addRelatives(_nameController.text, _surNameController.text, _phoneNumberController.text);
    Navigator.push(context, MaterialPageRoute(builder: (context) => RelativesListScreen()));
  }



}


