import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:gdg_flutter_app/utils/constants.dart';

class SpeakerCard extends StatelessWidget {
  // final String imageUrl;
  // final String speakerName;
  // final String

  const SpeakerCard({
    Key key,
  }) : super(key: key);
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
                    fadeInCurve: Curves.ease,
                    imageUrl: 'https://picsum.photos/200/300',
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Speaker Name',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600)),
                  Divider(
                    color: color,
                    thickness: 5,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('sdadd',
                      style: TextStyle(
                          color: Colors.black26,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 10,
                  ),
                  Text('sdadd',
                      style: TextStyle(
                          color: Colors.black26,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(FontAwesome.facebook),
                      Icon(FontAwesome.facebook),
                      Icon(FontAwesome.facebook),
                      Icon(FontAwesome.facebook),
                    ],
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
