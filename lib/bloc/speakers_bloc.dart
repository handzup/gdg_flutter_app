import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/speaker/speaker.dart';
import '../repository/speaker.dart';
import '../utils/hive.dart';
import '../utils/locator.dart';

class SpeakerBloc extends ChangeNotifier {
  final _speakerRepo = SpeakerRepository();

  var hive = locator<HiveWrapper>();

  List<Speaker> _spekaers = List<Speaker>();
  List<Speaker> get speakers => _spekaers;
  Future<List<Speaker>> getSpeakers() async {
    _spekaers = await _speakerRepo.getSpeakers();
    return _spekaers;
  }
}
