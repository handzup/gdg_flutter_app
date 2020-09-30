import 'package:flutter/material.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({
    Key key,
  }) : super(key: key);
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
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
              tag: 'Location',
              child: Material(
                  color: Colors.transparent,
                  child: Text('Location',
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
