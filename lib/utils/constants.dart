import 'dart:math';

import 'package:flutter/cupertino.dart';

enum Pages { agenda, team, sponsors, faq, locate, speakers }

class GoogleColors {
  static const Color blue = Color(0xFF4285F4);
  static const Color red = Color(0xFFEA4335);
  static const Color yellow = Color(0xFFFBBC05);
  static const Color green = Color(0xFF34A853);
  static List<Color> colors = [blue, red, yellow, green];
  static Color getGoogleRandomColor() {
    return colors[Random().nextInt(3)];
  }
}

abstract class CardAligns {
  static const Alignment agendaStartPosition = Alignment(-3.0, -.1);
  static const Alignment agendaEndPosition = Alignment(-0.8, -0.1);
  static const Alignment teamStartPosition = Alignment(-3.0, 0.5);
  static const Alignment teamEndPosition = Alignment(-0.8, 0.5);
  static const Alignment faqStartPosition = Alignment(-3.0, .84);
  static const Alignment faqEndPosition = Alignment(-0.8, 0.84);
  static const Alignment speakersStartPosition = Alignment(3.0, -.21);
  static const Alignment speakersEndPosition = Alignment(0.8, -0.21);
  static const Alignment sponsorsStartPosition = Alignment(3.0, 0.21);
  static const Alignment sponsorsEndPosition = Alignment(0.8, 0.21);
  static const Alignment locateStartPosition = Alignment(3.0, 0.8);
  static const Alignment locateEndPosition = Alignment(0.8, 0.8);
  static const Alignment carouselStartPosition = Alignment(0.0, -3.0);
  static const Alignment carouselEndPosition = Alignment(0.0, -1.0);
}
