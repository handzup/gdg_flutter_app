import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/partner/partner.dart';
import '../repository/partner.dart';

class PartnerBloc extends ChangeNotifier {
  final partnerRepo = PartnerRepository();

  List<Partner> _partner = List<Partner>();
  List<Partner> get partner => _partner;
  Future<List<Partner>> getPartners() async {
    _partner = await partnerRepo.getPartners();
    return _partner;
  }
}
