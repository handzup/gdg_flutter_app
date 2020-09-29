import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:gdg_flutter_app/bloc/sessions_bloc.dart';
import 'package:gdg_flutter_app/repository/speaker.dart';
import 'package:provider/provider.dart';

import '../widgets/carousel_slider.dart';
import '../widgets/main_page_card.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  bool show = false;
  final double cardHegiht = 5;
  final double cardWidth = 2.5;

  bb() {
    setState(() {
      show = !show;
    });
    Future.delayed(Duration(seconds: 1)).then((value) {
      setState(() {
        show = !show;
      });
    });
  }

  final sb = SessionBloc();
  final sp = SpeakerRepository();
  @override
  void initState() {
    //sp.getSpeaker('name');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Container(
              color: Colors.transparent,
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              alignment: show ? Alignment(0.0, -3.0) : Alignment(0.0, -1.0),
              curve: Curves.linearToEaseOut,
              child: Consumer<SessionBloc>(builder: (context, data, child) {
                return Carousel(
                  sessions: data.sessions.take(30).toList(),
                );
              }),
            ),
            AnimatedContainer(
              curve: Curves.linearToEaseOut,
              duration: Duration(milliseconds: 300),
              alignment: show ? Alignment(-3.0, -.1) : Alignment(-0.8, -0.1),
              child: AnimatedCard(
                callBack: bb,
                height: mq.height / cardHegiht,
                width: mq.width / cardWidth,
                icon: Feather.clock,
                title: 'Agenda',
              ),
            ),
            AnimatedContainer(
                curve: Curves.linearToEaseOut,
                duration: Duration(milliseconds: 400),
                alignment: show ? Alignment(-3.0, 0.5) : Alignment(-0.8, 0.5),
                child: AnimatedCard(
                  height: mq.height / cardHegiht,
                  width: mq.width / cardWidth,
                  icon: Feather.clock,
                  title: 'Team',
                  color: Colors.yellow[700],
                )),
            AnimatedContainer(
                curve: Curves.linearToEaseOut,
                duration: Duration(milliseconds: 500),
                alignment: show ? Alignment(-3.0, .84) : Alignment(-0.8, 0.84),
                child: AnimatedCard(
                  height: mq.height / cardHegiht / 2,
                  width: mq.width / cardWidth,
                  icon: Feather.message_circle,
                  title: 'FAQ',
                  isSmall: true,
                  color: Colors.green,
                )),
            AnimatedContainer(
                curve: Curves.linearToEaseOut,
                duration: Duration(milliseconds: 300),
                alignment: show ? Alignment(3.0, 0.8) : Alignment(0.8, 0.8),
                child: AnimatedCard(
                  height: mq.height / cardHegiht,
                  width: mq.width / cardWidth,
                  icon: Feather.map,
                  title: 'Locate Us',
                  color: Colors.blue,
                )),
            AnimatedContainer(
                curve: Curves.linearToEaseOut,
                duration: Duration(milliseconds: 400),
                alignment: show ? Alignment(3.0, 0.21) : Alignment(0.8, 0.21),
                child: AnimatedCard(
                  height: mq.height / cardHegiht,
                  width: mq.width / cardWidth,
                  icon: Feather.dollar_sign,
                  title: 'Sponsors',
                  color: Colors.green,
                )),
            AnimatedContainer(
                curve: Curves.linearToEaseOut,
                duration: Duration(milliseconds: 500),
                alignment: show ? Alignment(3.0, -.21) : Alignment(0.8, -0.21),
                child: AnimatedCard(
                  height: mq.height / cardHegiht / 2,
                  width: mq.width / cardWidth,
                  icon: Feather.user,
                  title: 'Speakers',
                  isSmall: true,
                  color: Colors.blue,
                ))
          ],
        ),
      ),
    );
  }
}
