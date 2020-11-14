import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gdg_flutter_app/bloc/partner_bloc.dart';
import 'package:gdg_flutter_app/bloc/theme_bloc.dart';
import 'package:gdg_flutter_app/styles.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'bloc/schedule_bloc.dart';
import 'bloc/sessions_bloc.dart';
import 'bloc/speakers_bloc.dart';
import 'bloc/team_bloc.dart';
import 'models/session/session.dart';
import 'models/speaker/badge.dart';
import 'models/speaker/social.dart';
import 'models/speaker/speaker.dart';
import 'pages/splash_screen.dart';
import 'utils/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  setupLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(SessionAdapter());
  Hive.registerAdapter(SpeakerAdapter());
  Hive.registerAdapter(SocialAdapter());
  Hive.registerAdapter(BadgeAdapter());

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider themeChangeProvider = ThemeProvider();

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.themePrefs.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SessionBloc>(
          create: (context) => SessionBloc(),
        ),
        ChangeNotifierProvider<ScheduleBloc>(
          create: (context) => ScheduleBloc(),
        ),
        ChangeNotifierProvider<SpeakerBloc>(
          create: (context) => SpeakerBloc(),
        ),
        ChangeNotifierProvider<TeamBloc>(
          create: (context) => TeamBloc(),
        ),
        ChangeNotifierProvider<PartnerBloc>(
          create: (context) => PartnerBloc(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => themeChangeProvider,
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
