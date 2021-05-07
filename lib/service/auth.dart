import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //giriş yap fonksiyonu
  Future<User> signIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  //çıkış yap fonksiyonu
  signOut() async {
    return await _auth.signOut();
  }

  //Kayıt ol fonksiyonu
  Future<User> createUser(String id, String name, String surName,
      String birthDate, String maritalStatus, String phoneNumber, String address, String email, String password) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firestore.collection("users").doc(user.user.uid).set({
      'id' : id,
      'name' : name,
      'surName' : surName,
      'birthDate' : birthDate,
      'maritalStatus' : maritalStatus,
      'phoneNumber' : phoneNumber,
      'address' : address,
      'email' : email
    });

    return user.user;
  }
}
