import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gdg_flutter_app/models/team/team.dart';
import 'package:gdg_flutter_app/repository/team.dart';

class TeamBloc extends ChangeNotifier {
  final teamRepo = TeamRepository();

  List<Team> _team = List<Team>();
  List<Team> get team => _team;
  Future<List<Team>> getTeams() async {
    _team = await teamRepo.getTeams();
    return _team;
  }
}
