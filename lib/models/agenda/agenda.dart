import 'package:gdg_flutter_app/models/session/session.dart';
import 'package:gdg_flutter_app/models/speaker/speaker.dart';

class Agenda {
  final Session agenda;
  final DateTime startTime;
  final Duration duration;
  final Speaker speaker;

  Agenda({this.agenda, this.startTime, this.duration, this.speaker});
}
