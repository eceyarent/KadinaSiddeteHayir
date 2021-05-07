import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kadina_siddete_hayir/models/informations.dart';

class informationDetailService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //veri ekleme fonksiyonu
  Future<void> addInformations(String textDetail) async {
    var ref = _firestore.collection("information");

    var documentRef = await ref.add({
      'textDetail' : textDetail,

    });

    return Informations(id: documentRef.id, textDetail:textDetail );

  }

  //veri gösterme fonksiyonu

  Stream<QuerySnapshot> getInformationDetail() {
    var ref = _firestore.collection("information").snapshots();

    return ref;
  }
}