import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Page(),
    );
  }
}

class Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageState();
}

class _PageState extends State<Page> with SingleTickerProviderStateMixin {
  // Set the initial position to something that will be offscreen for sure
  Tween<Offset> tween = Tween<Offset>(
    begin: Offset(0.0, 10000.0),
    end: Offset(0.0, 0.0),
  );
  Animation<Offset> animation;
  AnimationController animationController;

  GlobalKey _widgetKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    // initialize animation controller and the animation itself
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation = tween.animate(animationController);

    Future<void>.delayed(Duration(seconds: 1), () {
      // Get the screen size
      final Size screenSize = MediaQuery.of(context).size;
      // Get render box of the widget
      final RenderBox widgetRenderBox =
          _widgetKey.currentContext.findRenderObject();
      // Get widget's size
      final Size widgetSize = widgetRenderBox.size;

      // Calculate the dy offset.
      // We divide the screen height by 2 because the initial position of the widget is centered.
      // Ceil the value, so we get a position that is a bit lower the bottom edge of the screen.
      final double offset =
          (screenSize.height / 2 / widgetSize.height).ceilToDouble();

      // Re-set the tween and animation
      tween = Tween<Offset>(
        begin: Offset(0.0, offset),
        end: Offset(0.0, 0.0),
      );
      animation = tween.animate(animationController);

      // Call set state to re-render the widget with the new position.
      this.setState(() {
        // Animate it.
        animationController.forward();
      });
    });
  }

  @override
  void dispose() {
    // Don't forget to dispose the animation controller on class destruction
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.loose,
      children: <Widget>[
        SlideTransition(
          position: animation,
          child: CircleAvatar(
            key: _widgetKey,
            backgroundImage: NetworkImage(
              'https://pbs.twimg.com/media/DpeOMc3XgAIMyx_.jpg',
            ),
            radius: 50.0,
          ),
        ),
      ],
    );
  }
}
