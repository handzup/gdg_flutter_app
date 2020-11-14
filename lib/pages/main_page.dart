import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:gdg_flutter_app/bloc/partner_bloc.dart';
import 'package:gdg_flutter_app/bloc/schedule_bloc.dart';
import 'package:gdg_flutter_app/bloc/sessions_bloc.dart';
import 'package:gdg_flutter_app/bloc/speakers_bloc.dart';
import 'package:gdg_flutter_app/bloc/team_bloc.dart';
import 'package:gdg_flutter_app/pages/agenda_page.dart';
import 'package:gdg_flutter_app/pages/faq_page.dart';
import 'package:gdg_flutter_app/pages/location_page.dart';
import 'package:gdg_flutter_app/pages/speakers_page.dart';
import 'package:gdg_flutter_app/pages/sponsors_page.dart';
import 'package:gdg_flutter_app/pages/team_page.dart';
import 'package:gdg_flutter_app/utils/constants.dart';
import 'package:gdg_flutter_app/utils/next_screen.dart';
import 'package:provider/provider.dart';

import '../widgets/carousel_slider.dart';
import '../widgets/main_page_card.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  bool show = true;
  final double cardHegiht = 5.5;
  final double cardWidth = 2.5;
  Alignment agenda = CardAligns.agendaStartPosition;
  Alignment team = CardAligns.teamStartPosition;
  bb(title) {
    setState(() {
      show = !show;
      glob = title;
    });
    Future.delayed(Duration(milliseconds: 300)).then((value) {
      nextScale(context, nextPage(title), endPositon);
    });
  }

  nextPage(page) {
    switch (page) {
      case 'Agenda':
        return AgendaPage();
        break;
      case 'Team':
        return TeamPage();
        break;
      case 'FAQ':
        return FaqPage();
        break;
      case "Speakers":
        return SpeakersPage();
        break;
      case 'Sponsors':
        return SponsorsPage();
        break;
      case 'Locate Us':
        return LocationPage();
        break;
      default:
    }
  }

  endPositon() {
    Future.delayed(Duration(milliseconds: 300)).then((value) {
      setState(() {
        show = !show;
        glob = '';
      });
    });
  }

  String glob = '';
  @override
  void initState() {
    getHs();
    super.initState();
  }

  getHs() async {
    Future.delayed(Duration(milliseconds: 500)).then((value) {
      setState(() {
        show = !show;
      });
    });
    await Provider.of<ScheduleBloc>(context, listen: false).getSchedules();
    await Provider.of<SpeakerBloc>(context, listen: false).getSpeakers();
    await Provider.of<TeamBloc>(context, listen: false).getTeams();
    await Provider.of<PartnerBloc>(context, listen: false).getPartners();
  }

  Alignment generate(String title) {
    switch (title) {
      case 'Agenda':
        if (glob == title) {
          return Alignment.center;
        } else {
          return CardAligns.agendaStartPosition;
        }

        break;
      case 'Team':
        if (glob == title) {
          return Alignment.center;
        } else {
          return CardAligns.teamStartPosition;
        }

        break;
      case 'FAQ':
        if (glob == title) {
          return Alignment.center;
        } else {
          return CardAligns.faqStartPosition;
        }

        break;
      case 'Speakers':
        if (glob == title) {
          return Alignment.center;
        } else {
          return CardAligns.speakersStartPosition;
        }

        break;
      case 'Sponsors':
        if (glob == title) {
          return Alignment.center;
        } else {
          return CardAligns.sponsorsStartPosition;
        }

        break;
      case 'Locate Us':
        if (glob == title) {
          return Alignment.center;
        } else {
          return CardAligns.locateStartPosition;
        }

        break;

      default:
        return Alignment.bottomCenter;
    }
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
              alignment: show
                  ? CardAligns.carouselStartPosition
                  : CardAligns.carouselEndPosition,
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
              alignment:
                  show ? generate('Agenda') : CardAligns.agendaEndPosition,
              child: AnimatedCard(
                callBack: bb,
                height: mq.height / cardHegiht,
                width: mq.width / cardWidth,
                icon: Feather.clock,
                title: 'Agenda',
                color: GoogleColors.red,
              ),
            ),
            AnimatedContainer(
                curve: Curves.linearToEaseOut,
                duration: Duration(milliseconds: 400),
                alignment: show ? generate('Team') : CardAligns.teamEndPosition,
                child: AnimatedCard(
                  callBack: bb,
                  height: mq.height / cardHegiht,
                  width: mq.width / cardWidth,
                  icon: Feather.users,
                  title: 'Team',
                  color: GoogleColors.yellow,
                )),
            AnimatedContainer(
                curve: Curves.linearToEaseOut,
                duration: Duration(milliseconds: 500),
                alignment: show ? generate('FAQ') : CardAligns.faqEndPosition,
                child: AnimatedCard(
                  callBack: bb,
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
                alignment:
                    show ? generate('Locate Us') : CardAligns.locateEndPosition,
                child: AnimatedCard(
                  callBack: bb,
                  height: mq.height / cardHegiht,
                  width: mq.width / cardWidth,
                  icon: Feather.map,
                  title: 'Locate Us',
                  color: Colors.blue,
                )),
            AnimatedContainer(
                curve: Curves.linearToEaseOut,
                duration: Duration(milliseconds: 400),
                alignment: show
                    ? generate('Sponsors')
                    : CardAligns.sponsorsEndPosition,
                child: AnimatedCard(
                  callBack: bb,
                  height: mq.height / cardHegiht,
                  width: mq.width / cardWidth,
                  icon: Feather.dollar_sign,
                  title: 'Sponsors',
                  color: Colors.green,
                )),
            AnimatedContainer(
                curve: Curves.linearToEaseOut,
                duration: Duration(milliseconds: 500),
                alignment: show
                    ? generate('Speakers')
                    : CardAligns.speakersEndPosition,
                child: AnimatedCard(
                  callBack: bb,
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
