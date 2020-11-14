import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:gdg_flutter_app/bloc/theme_bloc.dart';
import 'package:gdg_flutter_app/utils/constants.dart';
import 'package:provider/provider.dart';

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
    final themeChange = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
          width: 120,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: DayNightSwitcher(dayBackgroundColor: GoogleColors.blue,
            sunColor: GoogleColors.yellow,
              isDarkModeEnabled: themeChange.darkTheme,
              onStateChanged: (isDarkModeEnabled) {
                themeChange.darkTheme = isDarkModeEnabled;
              },
            ),
          ),
        ],
      ),
      body: MainPage(),
    );
  }
}
