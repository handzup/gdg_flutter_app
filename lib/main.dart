import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'bloc/schedule_bloc.dart';
import 'bloc/sessions_bloc.dart';
import 'bloc/speakers_bloc.dart';
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

class MyApp extends StatelessWidget {
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.grey[50],
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
