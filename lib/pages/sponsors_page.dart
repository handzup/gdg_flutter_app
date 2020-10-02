import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gdg_flutter_app/bloc/partner_bloc.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SponsorsPage extends StatefulWidget {
  const SponsorsPage({
    Key key,
  }) : super(key: key);
  @override
  _SponsorsPageState createState() => _SponsorsPageState();
}

class _SponsorsPageState extends State<SponsorsPage> {
  // ignore: missing_return
  Future<bool> back() async {
    Navigator.of(context).pop('some valsue');
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: back,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Hero(
              tag: 'Sponsors',
              child: Material(
                  color: Colors.transparent,
                  child: Text('Sponsors',
                      style: Theme.of(context).textTheme.headline1))),
        ),
        body: Consumer<PartnerBloc>(
            builder: (context, data, child) {
              return Column(children: [
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.partner.length,
                      itemBuilder: (context, i) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(data.partner[i].title,
                                  style: Theme.of(context).textTheme.headline1),
                            ),
                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: data.partner[i].logos.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      _launchURL(
                                          data.partner[i].logos[index].url);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Card(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(18.0),
                                              child: CachedNetworkImage(
                                                height: 100,
                                                imageUrl: data.partner[i]
                                                    .logos[index].logoUrl,
                                                placeholder: (context, url) =>
                                                    CupertinoActivityIndicator(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  data.partner[i].logos[index]
                                                      .name,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline1),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ],
                        );
                      }),
                ),
              ]);
            },
            child: CupertinoActivityIndicator()),
      ),
    );
  }
}
