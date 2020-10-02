import 'package:flutter/material.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({
    Key key,
  }) : super(key: key);
  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  // ignore: missing_return
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
          elevation: 0,
          title: Hero(
              tag: 'Faq',
              child: Material(
                  color: Colors.transparent,
                  child: Text('Faq',
                      style: Theme.of(context).textTheme.headline1))),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Comming Soon', style: Theme.of(context).textTheme.headline1)
            ],
          ),
        ),
      ),
    );
  }
}
