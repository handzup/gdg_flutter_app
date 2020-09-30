import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gdg_flutter_app/models/speaker/speaker.dart';

import '../models/session/session.dart';
import '../repository/sessions.dart';
import '../repository/speaker.dart';

class SessionBloc extends ChangeNotifier {
  final _sessionRepo = SessionRepository();
  final _speakerRepo = SpeakerRepository();
  List<Session> _sessions = List<Session>();
  List<Session> get sessions => _sessions;
  List<Speaker> _spekaers = List<Speaker>();
  List<Speaker> get speakers => _spekaers;
  Future<List<Speaker>> getSpeakers() async {
    _spekaers = await _speakerRepo.getSpeakers();
    return _spekaers;
  }

  Future<List<Session>> getSessions() async {
    _sessions = await _sessionRepo.getSessions();
    await _speakerRepo.getSpeakers();
    for (var i = 0; i < _sessions.length; i++) {
      _sessions[i].speakers = await getSp(_sessions[i]);
    }
    return _sessions;
  }

  Future<List<Session>> getMobile() async {
    final data = _sessions
        .where((element) => element?.tags?.first == 'Android')
        .toList();
    return data;
  }

  Future<List<Speaker>> getSp(session) async {
    List<Speaker> speakers = <Speaker>[];

    if (session.speakers != null) {
      for (var i = 0; i < session?.speakers?.length; i++) {
        speakers
            .add(await _speakerRepo.getSpeaker(session?.speakers[i].queryPath));
      }
    }
    return speakers;
  }
}
