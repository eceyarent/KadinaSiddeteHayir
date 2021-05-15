import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kadina_siddete_hayir/models/informations.dart';

class informationsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //veri ekleme fonksiyonu
  Future<void> addInformations(String Text) async {
    var ref = _firestore.collection("information");

    var documentRef = await ref.add({
      'Text': Text,

    });

    return Informations(id: documentRef.id, Text: Text);

  }

  //veri gösterme fonksiyonu

  Stream<QuerySnapshot> getInformations(String text) {
    var ref = _firestore.collection("information").snapshots();

    return ref;
  }
}