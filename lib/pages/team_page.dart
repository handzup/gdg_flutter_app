import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({
    Key key,
  }) : super(key: key);
  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  Future<bool> back() async {
    Navigator.of(context).pop('some valsue');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: back,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Hero(
              tag: 'Team',
              child: Material(
                  color: Colors.transparent,
                  child: Text('Team',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600)))),
        ),
        body: Container(
          color: Colors.transparent,
        ),
      ),
    );
  }
}
