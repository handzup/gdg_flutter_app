import 'package:flutter/material.dart';

import '../styles.dart';
import 'main_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.primaryColor,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
          width: 120,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: MainPage(),
    );
  }
}
