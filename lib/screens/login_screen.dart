import 'package:flutter/material.dart';
import 'package:kadina_siddete_hayir/screens/home_page_screen.dart';
import 'package:kadina_siddete_hayir/service/auth.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
      return LoginScreenState();
  }

}

class LoginScreenState extends State {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Giriş yap"),
      ),
      body:SingleChildScrollView(
        padding: EdgeInsets.all(30.0),
        child:Column(
          children: <Widget>[
            buildEmailField(),buildPasswordField(),buildSaveButton(),
          ],
        ),
      ),
    );
  }



  buildEmailField(){
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(labelText: "Email"),


    );
  }


  buildPasswordField() {
    return TextField(
      controller: _passwordController,
      obscureText: true,
      decoration: InputDecoration(labelText: "Şifre"),


    );
  }


  buildSaveButton() {
    return SizedBox(
      width: 100.0,
      child: RaisedButton(
        child: Text("Giriş yap" , style: TextStyle(color:Colors.white)),
        color: Colors.deepPurple,
        elevation: 4.0,
        splashColor: Colors.grey,
        onPressed: (){
          goToHomePageScreen();
        }
      ),
    );
  }
void goToHomePageScreen() {
    _authService.signIn(_emailController.text, _passwordController.text).then((value){
      return Navigator.push(context,
        MaterialPageRoute(builder: (context) => HomePageScreen()));
    });
}

}