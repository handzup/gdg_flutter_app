import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../models/partner/partner.dart';

class PartnerRepository {
  Future<List<Partner>> getPartners() async {
    await Firebase.initializeApp();
    final document = FirebaseFirestore.instance.collection("partners").get();
    var partners = <Partner>[];
    await document.then((value) => value.docs.forEach((element) {
          partners.add(Partner.fromJson(element.data()));
        }));
    return partners;
  }
}
