import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdg_flutter_app/bloc/speakers_bloc.dart';
import 'package:gdg_flutter_app/utils/constants.dart';
import 'package:gdg_flutter_app/widgets/speaker_card.dart';
import 'package:provider/provider.dart';

class SpeakersPage extends StatefulWidget {
  const SpeakersPage({
    Key key,
  }) : super(key: key);
  @override
  _SpeakersPageState createState() => _SpeakersPageState();
}

class _SpeakersPageState extends State<SpeakersPage> {
  Future<bool> back() async {
    Navigator.of(context).pop('some valsue');
  }

  TabController _tabController;
  ScrollController _scrollController;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: back,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            final color = GoogleColors.getGoogleRandomColor();
            return <Widget>[
              SliverAppBar(
                leading: IconButton(
                    onPressed: () => back(),
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black87,
                    )),
                centerTitle: true,
                pinned: true,
                backgroundColor: Colors.grey[50],
                floating: true,
                elevation: 0,
                forceElevated: true,
                automaticallyImplyLeading: false,
                title: Container(
                  child: Hero(
                      tag: 'Speakers',
                      child: Material(
                          color: Colors.transparent,
                          child: Text('Speakers',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600)))),
                ),
              )
            ];
          },
          body: Column(children: [
            Expanded(
              child: Consumer<SpeakerBloc>(
                builder: (context, data, child) {
                  if (data.speakers.isEmpty) return child;
                  return ListView.builder(
                      itemCount: data.speakers.length,
                      itemBuilder: (context, index) {
                        return SpeakerCard(
                          imageUrl: data.speakers[index].photoUrl,
                          shortBio: data.speakers[index].shortBio,
                          speakerName: data.speakers[index].name,
                          badges: data.speakers[index].badges,
                          social: data.speakers[index].socials,
                        );
                      });
                },
                child: CupertinoActivityIndicator(),
              ),
            )
          ]),
          controller: _scrollController,
        ),
      ),
    );
  }
}
