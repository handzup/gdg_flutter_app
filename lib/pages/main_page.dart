import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  Tween<Offset> tween = Tween<Offset>(
    begin: const Offset(-1.2, 1.05),
    end: const Offset(0.0, 1.05),
  );
  Tween<Offset> tween2 = Tween<Offset>(
    begin: const Offset(-1.2, 1.05),
    end: const Offset(0.0, 1.05),
  );
  Tween<Offset> tween3 = Tween<Offset>(
    begin: const Offset(-1.2, 1.05),
    end: const Offset(0.0, 1.05),
  );
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..forward();
    _controller2 = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..forward();
    _controller3 = AnimationController(
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    )..forward();
    _rightFirst = tween.animate(_controller3);
    _rightSecond = tween2.animate(_controller2);
    _rightThird = tween3.animate(_controller);
    _topBlock = Tween<Offset>(
      begin: const Offset(0.0, -2.0),
      end: const Offset(0.0, 0.05),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastLinearToSlowEaseIn,
    ));

    _leftFirst = Tween<Offset>(
      begin: const Offset(-1.5, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastLinearToSlowEaseIn,
    ));
    _leftSecond = Tween<Offset>(
      begin: const Offset(-1.5, 1.05),
      end: const Offset(0.0, 1.05),
    ).animate(CurvedAnimation(
      parent: _controller2,
      curve: Curves.fastLinearToSlowEaseIn,
    ));
    _leftThird = Tween<Offset>(
      begin: const Offset(-1.5, 4.20),
      end: const Offset(0.0, 4.2),
    ).animate(CurvedAnimation(
      parent: _controller3,
      curve: Curves.fastLinearToSlowEaseIn,
    ));

    Future<void>.delayed(Duration(microseconds: 1), () {
      // Get the screen size
      final Size screenSize = MediaQuery.of(context).size;
      // Get render box of the widget
      // final RenderBox widgetRenderBox =
      //     _anim2.currentContext.findRenderObject();

      // Get widget's size
      // final Size widgetSize = widgetRenderBox.size;

      final double offset = double.parse(
          ((screenSize.width - 16) / 2 / (screenSize.width / 2.5 - 8))
              .toStringAsFixed(4));
      // Re-set the tween and animation
      tween = Tween<Offset>(
        begin: Offset(3, 1.6),
        end: Offset(offset, 1.6),
      );
      tween2 = Tween<Offset>(
        begin: Offset(3, 0.55),
        end: Offset(offset, 0.55),
      );
      tween3 = Tween<Offset>(
        begin: Offset(3, 0.0),
        end: Offset(offset, 0.0),
      );
      _rightFirst = tween.animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.fastLinearToSlowEaseIn,
      ));
      _rightSecond = tween2.animate(CurvedAnimation(
        parent: _controller2,
        curve: Curves.fastLinearToSlowEaseIn,
      ));
      _rightThird = tween3.animate(CurvedAnimation(
        parent: _controller3,
        curve: Curves.fastLinearToSlowEaseIn,
      ));

      // Call set state to re-render the widget with the new position.
      this.setState(() {
        // Animate it.
        _controller.forward();
        _controller2.forward();
        _controller3.forward();
      });
    });
  }

  AnimationController _controller;
  AnimationController _controller2;
  AnimationController _controller3;
  Animation<Offset> _topBlock;
  Animation<Offset> _leftFirst;
  Animation<Offset> _leftSecond;
  Animation<Offset> _leftThird;

  Animation<Offset> _rightFirst;
  Animation<Offset> _rightSecond;
  Animation<Offset> _rightThird;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          overflow: Overflow.clip,
          children: [
            Container(),
            topBlock(),
            Positioned(
                left: 20,
                right: 20,
                top: MediaQuery.of(context).size.height -
                    (MediaQuery.of(context).size.height - 230),
                child: Stack(
                  children: [
                    bottomBlock(
                        mq: mq,
                        right: false,
                        postion: _leftFirst,
                        title: 'Agenda',
                        icon: Feather.clock),
                    bottomBlock(
                        mq: mq,
                        right: false,
                        postion: _leftSecond,
                        title: 'Team',
                        icon: Feather.users,
                        color: Colors.yellow[700]),
                    bottomSmallBlock(
                        mq: mq,
                        right: false,
                        postion: _leftThird,
                        title: 'FAQ',
                        icon: Feather.message_circle,
                        color: Colors.green),
                    bottomBlock(
                        mq: mq,
                        right: false,
                        postion: _rightFirst,
                        title: 'Locate Us',
                        icon: Feather.map,
                        color: Colors.blue),
                    bottomBlock(
                        mq: mq,
                        right: false,
                        postion: _rightSecond,
                        title: 'Sponsors',
                        icon: Feather.dollar_sign,
                        color: Colors.green),
                    bottomSmallBlock(
                        mq: mq,
                        right: false,
                        postion: _rightThird,
                        title: 'Speakers',
                        icon: Feather.user,
                        color: Colors.blue),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget topBlock() {
    return SlideTransition(
      transformHitTests: true,
      textDirection: TextDirection.ltr,
      position: _topBlock,
      child: Container(
        child: InkWell(
          child: Container(),
          onTap: () {
            _controller.forward(from: 0.0);
            _controller2.forward(from: 0.0);
            _controller3.forward(from: 0.0);
            print('object');
          },
        ),
        height: 200,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: Colors.white,
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

  Widget bottomBlock(
      {@required Size mq,
      @required bool right,
      @required dynamic postion,
      @required String title,
      @required IconData icon,
      Color color = Colors.red}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: SlideTransition(
        transformHitTests: true,
        textDirection: TextDirection.ltr,
        position: postion,
        child: Container(
          height: mq.height / 5,
          width: mq.width / 2.5 - 8,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.2),
                  blurRadius: 8.0,
                ),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Icon(
                icon,
                color: color,
                size: 40,
              ),
              Spacer(),
              Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomSmallBlock(
      {@required Size mq,
      @required bool right,
      @required dynamic postion,
      @required String title,
      @required IconData icon,
      Color color = Colors.red}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: SlideTransition(
        transformHitTests: true,
        textDirection: TextDirection.ltr,
        position: postion,
        child: Container(
          height: mq.height / 10,
          width: mq.width / 2.5 - 8,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.2),
                  blurRadius: 8.0,
                ),
              ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Icon(
                icon,
                textDirection: TextDirection.ltr,
                color: color,
                size: 30,
              ),
              Spacer(),
              Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
