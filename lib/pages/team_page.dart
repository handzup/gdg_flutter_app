import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:provider/provider.dart';

import '../bloc/team_bloc.dart';
import '../models/session/session.dart';
import '../utils/constants.dart';
import '../widgets/speaker_card.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({
    Key key,
  }) : super(key: key);
  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  List<Session> mobile = <Session>[];
  @override
  initState() {
    super.initState();
  }

  // ignore: missing_return
  Future<bool> back() async {
    Navigator.of(context).pop('some valsue');
  }

  TabController _tabController;
  ScrollController _scrollController;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: back,
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                final color = GoogleColors.getGoogleRandomColor();
                return <Widget>[
                  SliverAppBar(
                    bottom: TabBar(
                        controller: _tabController,
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelColor: color,
                        unselectedLabelColor: Color(0xff5f6368), //niceish grey
                        isScrollable: false,
                        indicator: MD2Indicator(
                            indicatorHeight: 5,
                            indicatorColor: color,
                            indicatorSize: MD2IndicatorSize
                                .full //3 different modes tiny-normal-full
                            ),
                        tabs: <Widget>[
                          Tab(
                            icon: Icon(FlutterIcons.team_ant),
                            child: Text(
                              'Core Team',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Tab(
                            icon: Icon(Feather.users),
                            child: Text(
                              'Program Committee',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ]),
                    automaticallyImplyLeading: false,
                    centerTitle: true,
                    titleSpacing: 0,
                    pinned: true,
                    floating: true,
                    forceElevated: innerBoxIsScrolled,
                    leading: IconButton(
                        onPressed: () => back(),
                        icon: Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).buttonColor,
                        )),
                    title: Container(
                      child: Hero(
                          tag: 'Team',
                          child: Material(
                              color: Colors.transparent,
                              child: Text('Team',
                                  style:
                                      Theme.of(context).textTheme.headline1))),
                    ),
                  )
                ];
              },
              body: TabBarView(
                children: <Widget>[
                  Consumer<TeamBloc>(
                    builder: (context, data, child) {
                      // ignore: null_aware_in_condition
                      if (data.team[0]?.members?.isEmpty) return child;
                      return ListView.builder(
                          itemCount: data.team[0].members.length,
                          itemBuilder: (context, index) {
                            return SpeakerCard(
                              title: data.team[0].members[index].title,
                              imageUrl: data.team[0].members[index].photoUrl,
                              shortBio: data.team[0].members[index].shortBio,
                              speakerName: data.team[0].members[index].name,
                              social: data.team[0].members[index].socials,
                            );
                          });
                    },
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                  Consumer<TeamBloc>(
                    builder: (context, data, child) {
                      if (data.team.isEmpty) return child;
                      return ListView.builder(
                          itemCount: data.team[1].members.length,
                          itemBuilder: (context, index) {
                            return SpeakerCard(
                              title: data.team[1].members[index].title,
                              imageUrl: data.team[1].members[index].photoUrl,
                              shortBio: data.team[1].members[index].shortBio,
                              speakerName: data.team[1].members[index].name,
                              social: data.team[1].members[index].socials,
                            );
                          });
                    },
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              controller: _scrollController,
            ),
          ),
        ));
  }
}
