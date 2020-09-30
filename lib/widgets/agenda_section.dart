import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gdg_flutter_app/models/session/session.dart';
import 'package:gdg_flutter_app/utils/constants.dart';

class AgendaSection extends StatelessWidget {
  final List<Session> data;

  const AgendaSection({Key key, @required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(data.length);
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final color = GoogleColors.getGoogleRandomColor();
          return Card(
            child: ListTile(
              isThreeLine: true,
              leading: Container(
                width: 60,
                height: 60,
                child: CircleAvatar(
                  child: CachedNetworkImage(
                    imageUrl: data[index].speakers[0].photoUrl,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(width: 2, color: color),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              title: Text(
                data[index].title,
                maxLines: 2,
                style: TextStyle(
                    color: Colors.black87,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data[index].speakers[0].name,
                    style: TextStyle(
                        color: color,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    data[index].speakers[0].title,
                    maxLines: 2,
                  ),
                ],
              ),
              trailing: Column(
                children: [
                  Text(
                    data[index].tags.first,
                    style: TextStyle(
                        color: Colors.black87,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold),
                  ),
                  Text(data[index].id.toString()),
                ],
              ),
            ),
          );
        });
  }
}
