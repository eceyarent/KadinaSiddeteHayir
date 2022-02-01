import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kadina_siddete_hayir/screens/login_screen.dart';
import 'package:kadina_siddete_hayir/screens/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj = "Kadına Şiddete Hayır";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text(mesaj),
      ),
      body: Center(
        child: Column(
          children: [
            buildAppLogoField(),
            buildLoginButtonField(),
            buildRegisterButtonField(),
          ],
        ),
      ),
    );
  }

  buildAppLogoField() {
    return Padding(
      padding: EdgeInsets.all(100.0),
      child: CircleAvatar(
        radius: 60,
        backgroundImage: NetworkImage(
            "https://cdn.pixabay.com/photo/2016/07/21/15/38/no-1532838__340.jpg"),
      ),
    );
  }

  buildLoginButtonField() {
    return SizedBox(
      width: 250.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
            child:
                const Text("Giriş yap", style: TextStyle(color: Colors.white)),
            color: Colors.deepPurple,
            elevation: 4.0,
            splashColor: Colors.grey,
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                )),
      ),
    );
  }

  buildRegisterButtonField() {
    return SizedBox(
      width: 250.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
            child:
                const Text("Kayıt ol", style: TextStyle(color: Colors.white)),
            color: Colors.deepPurple,
            elevation: 4.0,
            splashColor: Colors.grey,
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                )),
      ),
    );
  }
}
