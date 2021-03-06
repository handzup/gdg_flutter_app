import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:gdg_flutter_app/bloc/sessions_bloc.dart';
import 'package:gdg_flutter_app/pages/bubles.dart';
import 'package:gdg_flutter_app/pages/nointernet_page.dart';
import 'package:gdg_flutter_app/utils/next_screen.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkConnectivity();
    super.initState();
  }

  checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      nextScreenReplace(context, NoInternet());
    } else {
      loadData();
    }
  }

  loadData() async {
    Future.delayed(Duration(seconds: 0)).then((value) async {
      final sectionBloc = Provider.of<SessionBloc>(context, listen: false);
      sectionBloc
          .getSessions()
          .then((value) => nextScreenReplace(context, MyHomePage()));
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Bubbles(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Welcome ',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue[700]),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'to',
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.w900)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Image.asset(
                  'assets/images/gdg-logo.png',
                  fit: BoxFit.cover,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
