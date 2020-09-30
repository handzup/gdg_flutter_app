import 'package:gdg_flutter_app/models/session/session.dart';
import 'package:gdg_flutter_app/models/speaker/speaker.dart';
import 'package:hive/hive.dart';

class HiveWrapper {
  Future<Session> readSessionBox(key) async {
    final box = await Hive.openBox<Session>('session');
    var secData = Session();
    secData = box.get(key.hashCode);
    return secData;
  }

  writeSessionBox(List<Session> item) async {
    final openBox = await Hive.openBox<Session>('session');
    item.forEach((i) async {
      await openBox.put(i.id.hashCode, i);
    });
  }

  Future<Speaker> readSpeakernBox(key) async {
    final box = await Hive.openBox<Speaker>('speaker');
    var secData = Speaker();
    secData = box.get(key);
    return secData;
  }

  writeSpeakernBox(Speaker item) async {
    final openBox = await Hive.openBox<Speaker>('speaker');
    final arKey = item.queryPath.hashCode;
    await openBox.put(arKey, item);
  }
}
