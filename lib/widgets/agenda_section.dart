import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gdg_flutter_app/models/agenda/agenda.dart';
import 'package:gdg_flutter_app/utils/constants.dart';

class AgendaSection extends StatelessWidget {
  final List<Agenda> data;

  const AgendaSection({Key key, @required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(data.length.toString() + 'len');
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
                child: (data[index].agenda.speakers.isNotEmpty &&
                        data[index].agenda.speakers?.first?.photoUrl != null)
                    ? CircleAvatar(
                        child: CachedNetworkImage(
                          imageUrl: data[index].agenda.speakers.first.photoUrl,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(width: 2, color: color),
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      )
                    : SizedBox.shrink(),
              ),
              title: Text(
                data[index].agenda.title ?? '',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.headline1,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data[index].agenda.speakers.isNotEmpty
                        ? data[index].agenda?.speakers?.first?.name ?? ''
                        : '',
                    style: TextStyle(
                        color: color,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    data[index].agenda.speakers.isNotEmpty
                        ? data[index].agenda.speakers?.first?.title ?? ''
                        : '',
                    maxLines: 2,
                  ),
                ],
              ),
              trailing: Column(
                children: [
                  Text(
                    data[index].duration?.inMinutes?.toString() + ' Mins' ?? '',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(data[index].startTime ?? ''),
                ],
              ),
            ),
          );
        });
  }
}
