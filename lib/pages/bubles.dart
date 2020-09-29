import 'dart:math';

import 'package:flutter/material.dart';

class Bubbles extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BubblesState();
  }
}

class _BubblesState extends State<Bubbles> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  List<Bubble> bubbles;
  final int numberOfBubbles = 200;
  final Color color = Colors.amber;
  final double maxBubbleSize = 10.0;
  final colors = <MaterialColor>[
    Colors.green,
    Colors.amber,
    Colors.blue,
    Colors.red
  ];
  @override
  void initState() {
    super.initState();

    // Initialize bubbles
    bubbles = List();
    int i = numberOfBubbles;
    while (i > 0) {
      bubbles.add(Bubble(colors[Random().nextInt(3)], maxBubbleSize));
      i--;
    }

    // Init animation controller
    _controller = new AnimationController(
        duration: const Duration(seconds: 1000), vsync: this);
    Size mq;

    Future<void>.delayed(Duration(microseconds: 1), () {
      mq = MediaQuery.of(context).size;
    });
    _controller.addListener(() {
      updateBubblePosition(mq);
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CustomPaint(
          foregroundPainter: BubblePainter(
              bubbles: bubbles, controller: _controller, context: context),
          size: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height),
        ),
      ),
    );
  }

  void updateBubblePosition(Size canvasSize) {
    bubbles.forEach((it) => it.updatePosition(canvasSize));
    setState(() {});
  }
}

class BubblePainter extends CustomPainter {
  List<Bubble> bubbles;
  AnimationController controller;
  BuildContext context;
  BubblePainter({this.bubbles, this.controller, this.context});

  @override
  void paint(Canvas canvas, Size canvasSize) {
    bubbles.forEach((it) => it.draw(canvas, canvasSize));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Bubble {
  Color colour;
  double direction;
  double speed;
  double radius;
  double x;
  double y;

  Bubble(Color colour, double maxBubbleSize) {
    this.colour = colour.withOpacity(Random().nextDouble());
    this.direction = Random().nextDouble() * 360;
    this.speed = 1;
    this.radius = Random().nextDouble() * maxBubbleSize;
  }

  draw(Canvas canvas, Size canvasSize) {
    Paint paint = new Paint()
      ..color = colour
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    assignRandomPositionIfUninitialized(canvasSize);

    randomlyChangeDirectionIfEdgeReached(canvasSize);

    canvas.drawCircle(Offset(x, y), radius, paint);
  }

  void assignRandomPositionIfUninitialized(Size canvasSize) {
    if (x == null) {
      this.x = Random().nextDouble() * canvasSize.width;
    }

    if (y == null) {
      this.y = Random().nextDouble() * canvasSize.height;
    }
  }

  updatePosition(Size canvasSize) {
    var a = 180 - (direction + 90);
    if (canvasSize != null) {
      direction > 0 && direction < 180
          ? x != null
              ? x += speed * sin(direction) / sin(speed)
              : x = Random().nextDouble() * canvasSize?.width
          : x != null
              ? x -= speed * sin(direction) / sin(speed)
              : x = Random().nextDouble() * canvasSize?.width;
      direction > 90 && direction < 270
          ? y != null
              ? y += speed * sin(a) / sin(speed)
              : y = Random().nextDouble() * canvasSize?.height
          : y != null
              ? y -= speed * sin(a) / sin(speed)
              : y = Random().nextDouble() * canvasSize?.height;
    }
  }

  randomlyChangeDirectionIfEdgeReached(Size canvasSize) {
    if (x > canvasSize.width || x < 0 || y > canvasSize.height || y < 0) {
      direction = Random().nextDouble() * 360;
    }
  }
}
// Positioned(
//   child: bottomBlock(
//       mq: mq,
//       right: false,
//       postion: _leftFirst,
//       title: 'Agenda',
//       icon: Feather.clock),
// ),
// Positioned(
//   child: bottomBlock(
//       mq: mq,
//       right: false,
//       postion: _leftSecond,
//       title: 'Team',
//       icon: Feather.users,
//       color: Colors.yellow[700]),
// ),
// bottomSmallBlock(
//     mq: mq,
//     right: false,
//     postion: _leftThird,
//     title: 'FAQ',
//     icon: Feather.message_circle,
//     color: Colors.green),
// bottomBlock(
//     mq: mq,
//     right: false,
//     postion: _rightFirst,
//     title: 'Locate Us',
//     icon: Feather.map,
//     color: Colors.blue),
// bottomBlock(
//     mq: mq,
//     right: false,
//     postion: _rightSecond,
//     title: 'Sponsors',
//     icon: Feather.dollar_sign,
//     color: Colors.green),
// bottomSmallBlock(
//     mq: mq,
//     right: false,
//     postion: _rightThird,
//     title: 'Speakers',
//     icon: Feather.user,
//     color: Colors.blue),
