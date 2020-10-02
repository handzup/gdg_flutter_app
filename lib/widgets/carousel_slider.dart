import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:gdg_flutter_app/models/session/session.dart';

class Carousel extends StatelessWidget {
  final List<Session> sessions;
  const Carousel({
    this.sessions,
    Key key,
  }) : super(key: key);

  getIcons(String tag) {
    switch (tag) {
      case 'Cloud':
        return AntDesign.cloud;
        break;
      case 'Android':
        return AntDesign.android1;
        break;
      case 'Web':
        return AntDesign.chrome;
        break;
      default:
        return AntDesign.cloud;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: CarouselSlider.builder(
          options: CarouselOptions(
              disableCenter: true,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayInterval: Duration(seconds: 2)),
          itemCount: sessions.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sessions[index].title,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    sessions[index].description,
                    softWrap: true,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Row(
                    children: [
                      Icon(
                        getIcons(sessions[index].tags[0]),
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        FlutterIcons.brain_faw5s,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        sessions[index].complexity,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400),
                      ),
                      Spacer(),
                      Stack(
                        children: [
                          Row(),
                          Container(
                            alignment: Alignment.topRight,
                            width: 150,
                            height: 50,
                            child: ListView.builder(
                                reverse: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: sessions[index].speakers.length,
                                itemBuilder: (context, i) {
                                  return CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          sessions[index].speakers[i].photoUrl,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                              width: 2,
                                              color: Colors.yellow[600]),
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              )),
            );
          },
        ),
        height: 200,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.2),
                blurRadius: 8.0,
              ),
            ]),
      ),
    );
  }
}
