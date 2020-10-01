import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gdg_flutter_app/models/speaker/speaker.dart';
import '../models/agenda/agenda.dart';
import '../utils/hive.dart';
import '../utils/locator.dart';

import '../models/schelude/schelude.dart';
import '../repository/schedule.dart';
import 'package:intl/intl.dart';

class ScheduleBloc extends ChangeNotifier {
  final _speakerRepo = ScheduleRepository();
  final hive = locator<HiveWrapper>();
  var df = DateFormat("HH:mm");
  List<Schelude> _schedules = List<Schelude>();
  List<Schelude> get schedules => _schedules;
  List<Agenda> _agenda = List<Agenda>();
  List<Agenda> get agenda => _agenda;
  List<Agenda> _web = List<Agenda>();
  List<Agenda> get web => _web;
  List<Agenda> _mobile = List<Agenda>();
  List<Agenda> get mobile => _mobile;
  List<Agenda> _cloud = List<Agenda>();
  List<Agenda> get cloud => _cloud;
  Future<List<Schelude>> getSchedules() async {
    _schedules = await _speakerRepo.getSchedules();
    notifyListeners();
    return _schedules;
  }

  agendaSort() {
    _mobile.clear();
    _web.clear();
    _cloud.clear();
    _agenda.forEach((element) {
      switch (element.agenda?.tags?.first) {
        case 'Android':
          _mobile.add(element);
          break;
        case 'Cloud':
          _cloud.add(element);
          break;
        default:
          _web.add(element);
      }
    });
    notifyListeners();
  }

  agendaToList(int item, String endTime, String startTime) async {
    final data = await hive.readSessionBox(item);
    var speaker;
    var end = df.parse(endTime.toString());
    var start = df.parse(startTime.toString());
    if (data.speakers.isNotEmpty) {
      speaker = await hive.readSpeakernBox(data?.speakers?.first?.queryPath);
      return Agenda(
          agenda: data,
          duration: Duration(minutes: end.difference(start).inMinutes),
          speaker: speaker,
          startTime: startTime);
    } else {
      return Agenda(
          agenda: data,
          duration: Duration(minutes: end.difference(start).inMinutes),
          speaker: speaker ?? Speaker(),
          startTime: startTime);
    }
  }

  Future<List<Agenda>> createAgenda() async {
    var item;
    var startTime;
    var endTime;
    var data = <Agenda>[];
    for (var i = 0; i < _schedules.length; i++) {
      for (var j = 0; j < _schedules[i].timeslots.length; j++) {
        for (var k = 0; k < _schedules[i].timeslots[j].sessions.length; k++) {
          for (var o = 0;
              o < _schedules[i].timeslots[j].sessions[k].items.length;
              o++) {
            item = _schedules[i].timeslots[j].sessions[k].items[o];
            startTime = _schedules[i].timeslots[j].startTime;
            endTime = _schedules[i].timeslots[j].endTime;
            data.add(await agendaToList(item, endTime, startTime));
          }
        }
      }
    }
    _agenda = data;
    notifyListeners();
    return data;
  }
}
