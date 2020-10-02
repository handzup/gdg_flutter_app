import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdg_flutter_app/bloc/speakers_bloc.dart';
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
  // ignore: missing_return
  Future<bool> back() async {
    Navigator.of(context).pop('some valsue');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: back,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Hero(
              tag: 'Speakers',
              child: Material(
                  color: Colors.transparent,
                  child: Text('Speakers',
                      style: Theme.of(context).textTheme.headline1))),
        ),
        body: Column(children: [
          Expanded(
            child: Consumer<SpeakerBloc>(
              builder: (context, data, child) {
                if (data.speakers.isEmpty) return child;
                return ListView.builder(
                    itemCount: data.speakers.length,
                    itemBuilder: (context, index) {
                      return SpeakerCard(
                        title: data.speakers[index].title,
                        imageUrl: data.speakers[index].photoUrl,
                        shortBio: data.speakers[index].shortBio,
                        speakerName: data.speakers[index].name,
                        social: data.speakers[index].socials,
                      );
                    });
              },
              child: CupertinoActivityIndicator(),
            ),
          )
        ]),
      ),
    );
  }
}
