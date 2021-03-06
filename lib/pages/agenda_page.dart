import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:gdg_flutter_app/bloc/schedule_bloc.dart';
import 'package:gdg_flutter_app/models/session/session.dart';
import 'package:gdg_flutter_app/utils/constants.dart';
import 'package:gdg_flutter_app/widgets/agenda_section.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:provider/provider.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({
    Key key,
  }) : super(key: key);
  @override
  _AgendaPageState createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  List<Session> mobile = <Session>[];
  @override
  initState() {
    Future.delayed(Duration.zero).then((value) => getDatas());
    super.initState();
  }

  getDatas() async {
    await Provider.of<ScheduleBloc>(context, listen: false).createAgenda();
    await Provider.of<ScheduleBloc>(context, listen: false).agendaSort();
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
          initialIndex: 1,
          length: 3,
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
                            icon: Icon(Feather.cloud),
                            child: Text(
                              'Cloud',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Tab(
                            icon: Icon(Feather.chrome),
                            child: Text(
                              'Web & More',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Tab(
                            icon: Icon(AntDesign.android1),
                            child: Text(
                              'Mobile',
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
                          tag: 'Agenda',
                          child: Material(
                              color: Colors.transparent,
                              child: Text('Agenda',
                                  style:
                                      Theme.of(context).textTheme.headline1))),
                    ),
                  )
                ];
              },
              body: TabBarView(
                children: <Widget>[
                  Consumer<ScheduleBloc>(
                    builder: (context, data, child) {
                      if (data.cloud.isEmpty) return child;
                      return AgendaSection(
                        data: data.cloud,
                      );
                    },
                    child: Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  ),
                  Consumer<ScheduleBloc>(
                    builder: (context, data, child) {
                      if (data.web.isEmpty) return child;
                      return AgendaSection(
                        data: data.web,
                      );
                    },
                    child: Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  ),
                  Consumer<ScheduleBloc>(
                    builder: (context, data, child) {
                      if (data.mobile.isEmpty) return child;
                      return AgendaSection(
                        data: data.mobile,
                      );
                    },
                    child: Center(
                      child: CupertinoActivityIndicator(),
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
