import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:gdg_flutter_app/models/speaker/badge.dart';
import 'package:gdg_flutter_app/models/speaker/social.dart';
import 'package:gdg_flutter_app/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class SpeakerCard extends StatelessWidget {
  final String imageUrl;
  final String speakerName;
  final String shortBio;
  final String title;
  final List<Social> social;

  const SpeakerCard({
    Key key,
    @required this.title,
    @required this.imageUrl,
    @required this.speakerName,
    @required this.shortBio,
    this.social,
  }) : super(key: key);
  List<Widget> generateIcons(List<Social> social) {
    var list = <Widget>[];
    social.forEach((element) {
      list.add(socialWidget(element));
    });
    return list;
  }

  Widget socialWidget(Social element) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => _launchURL(element.link),
        child: Icon(getIcon(element.icon)),
      ),
    );
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  getIcon(String iconName) {
    switch (iconName) {
      case 'linkedin':
        return FontAwesome.linkedin;
        break;
      case 'facebook':
        return FontAwesome.facebook;
        break;
      case 'website':
        return FontAwesome.internet_explorer;
        break;
      case 'twitter':
        return FontAwesome.twitter;
        break;
      case 'github':
        return FontAwesome.github;
        break;
      case 'instagram':
        return FontAwesome.instagram;
        break;
      default:
        return FontAwesome.chrome;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = GoogleColors.getGoogleRandomColor();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        shadowColor: color,
        child: Row(
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    height: 150,
                    width: 100,
                    fit: BoxFit.cover,
                    fadeInCurve: Curves.ease,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    imageUrl: imageUrl ?? 'https://picsum.photos/200/300',
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(speakerName ?? '',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600)),
                  Divider(
                    color: color,
                    thickness: 5,
                    endIndent: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(title ?? '',
                      style: TextStyle(
                          color: Colors.black26,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(shortBio ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                          color: Colors.black26,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: generateIcons(social),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
