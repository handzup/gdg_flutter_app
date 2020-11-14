import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:gdg_flutter_app/pages/splash_screen.dart';
import 'package:gdg_flutter_app/utils/next_screen.dart';

class NoInternet extends StatefulWidget {
  @override
  _NoInternetState createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  StreamSubscription<ConnectivityResult> subscription;

  @override
  void initState() {
    checkConnectivity();
    super.initState();
  }

  checkConnectivity() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
      } else {
        nextScreenReplace(context, SplashScreen());
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/googe_dino.png'),
          Text(
            'No internet connection :(',
            style: Theme.of(context).textTheme.headline1,
          )
        ],
      )),
    );
  }
}
