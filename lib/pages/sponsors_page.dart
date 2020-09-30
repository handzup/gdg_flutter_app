import 'package:flutter/material.dart';

class SponsorsPage extends StatefulWidget {
  const SponsorsPage({
    Key key,
  }) : super(key: key);
  @override
  _SponsorsPageState createState() => _SponsorsPageState();
}

class _SponsorsPageState extends State<SponsorsPage> {
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
              tag: 'Sponsors',
              child: Material(
                  color: Colors.transparent,
                  child: Text('Sponsors',
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
