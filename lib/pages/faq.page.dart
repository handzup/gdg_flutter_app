import 'package:flutter/material.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({
    Key key,
  }) : super(key: key);
  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
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
              tag: 'Faq',
              child: Material(
                  color: Colors.transparent,
                  child: Text('Faq',
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
