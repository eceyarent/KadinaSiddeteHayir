import 'package:flutter/material.dart';
import 'package:kadina_siddete_hayir/screens/home_page_screen.dart';
import 'package:kadina_siddete_hayir/screens/login_screen.dart';
import 'package:kadina_siddete_hayir/service/auth.dart';

class RegisterScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return RegisterScreenState();
  }

}

class RegisterScreenState extends State{
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surNameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _maritalStatusController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text("Kayıt ol"),
        ),
        body:SingleChildScrollView(
          padding: EdgeInsets.all(30.0),
          child:Column(
            children: <Widget>[
              buildIdField(),buildNameField(),buildSurnameField(),buildDateOfBirthField(),buildMaritalStatusField(),buildNumberField(),buildAddressField(),buildEmailField(),buildPasswordField(),buildSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  buildIdField(){
    return TextField(
      controller: _idController,
      decoration: InputDecoration(labelText: "TC No"),
    );
  }

  buildNameField(){
    return TextField(
      controller: _nameController,
      decoration: InputDecoration(labelText: "Ad"),
    );
  }

  buildSurnameField(){
    return TextField(
      controller: _surNameController,
      decoration: InputDecoration(labelText: "Soyad"),
    );
  }

  buildDateOfBirthField(){
    return TextField(
      controller: _birthDateController,
      decoration: InputDecoration(labelText: "Doğum Tarihi"),
    );
  }
  buildMaritalStatusField(){
    return TextField(
      controller: _maritalStatusController,
      decoration: InputDecoration(labelText: "Medeni Durum"),
    );
  }
  buildNumberField(){
    return TextField(
      controller: _numberController,
      decoration: InputDecoration(labelText: "Telefon No"),
    );
  }

  buildAddressField(){
    return TextField(
      controller: _addressController,
        decoration: InputDecoration(labelText: "Adres"),
    );
  }
  buildEmailField(){
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(labelText: "Email"),
    );
  }

  buildPasswordField(){
    return TextField(
      obscureText: true,
      controller: _passwordController,
      decoration: InputDecoration(labelText: "Şifre"),
    );
  }

  buildSaveButton() {
    return SizedBox(
      child: RaisedButton(
        child: Text("Kayıt ol" , style: TextStyle(color:Colors.white)),
        color: Colors.deepPurple,
        elevation: 4.0,
        splashColor: Colors.grey,
        onPressed: () {
          goToLoginPageScreen();

        }
      ),
    );
  }
  void goToLoginPageScreen() {
    _authService.createUser(_idController.text, _nameController.text, _surNameController.text, _birthDateController.text, _maritalStatusController.text, _numberController.text, _addressController.text, _emailController.text, _passwordController.text).then((value) {
      return Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageScreen()));

    });


  }

}