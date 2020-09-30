import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gdg_flutter_app/models/agenda/agenda.dart';

import '../models/schelude/schelude.dart';
import '../repository/schedule.dart';

class ScheduleBloc extends ChangeNotifier {
  final _speakerRepo = ScheduleRepository();

  List<Schelude> _schedules = List<Schelude>();
  List<Schelude> get schedules => _schedules;
  Future<List<Schelude>> getSchedules() async {
    _schedules = await _speakerRepo.getSchedules();
    return _schedules;
  }

  createAgenda() {
    var item;
    var startTime;
    var endTime;
    var agenda = <Agenda>[];
    for (var i = 0; i < _schedules.length; i++) {
      for (var j = 0; j < _schedules[i].timeslots.length; j++) {
        for (var k = 0; k < _schedules[i].timeslots[j].sessions.length; k++) {
          for (var o = 0;
              o < _schedules[i].timeslots[j].sessions[k].items.length;
              o++) {
            item = _schedules[i].timeslots[j].sessions[k].items[o];
            startTime = _schedules[i].timeslots[j].startTime;
            endTime = _schedules[i].timeslots[j].endTime;
          }
        }
      }
    }
  }
}
