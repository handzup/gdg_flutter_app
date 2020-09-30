import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void nextScreenCloseOthers(context, page) {
  Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (context) => page), (route) => false);
}

void nextScale(context, page, callBack) {
  Navigator.push(
      context,
      PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 300),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return ScaleTransition(
              alignment: Alignment.center,
              scale: CurvedAnimation(
                parent: animation,
                curve: Interval(
                  0.00,
                  0.50,
                  curve: Curves.ease,
                ),
              ),
              child: child,
            );
          },
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return page;
          })).then((value) => callBack());
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}

// void nextScreen(context, page) {
//   Navigator.push(context, CupertinoPageRoute(builder: (context) => page));
// }

// void nextScreenCloseOthers(context, page) {
//   Navigator.pushAndRemoveUntil(
//     context,
//     CupertinoPageRoute(builder: (context) => page),
//     (route) => false,
//   );
// }

// void nextScreenReplace(context, page) {
//   Navigator.pushReplacement(
//       context, CupertinoPageRoute(builder: (context) => page));
// }
