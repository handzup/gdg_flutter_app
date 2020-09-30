import 'package:flutter/material.dart';

class SpeakersPage extends StatefulWidget {
  const SpeakersPage({
    Key key,
  }) : super(key: key);
  @override
  _SpeakersPageState createState() => _SpeakersPageState();
}

class _SpeakersPageState extends State<SpeakersPage> {
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
              tag: 'Speakers',
              child: Material(
                  color: Colors.transparent,
                  child: Text('Speakers',
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
