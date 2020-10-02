import 'package:flutter/material.dart';

class AnimatedCard extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  final IconData icon;
  final Color color;
  final bool isSmall;
  final Function callBack;
  const AnimatedCard(
      {Key key,
      @required this.height,
      @required this.width,
      @required this.title,
      @required this.icon,
      this.isSmall = false,
      this.color = Colors.red,
      this.callBack})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => callBack != null ? callBack(title) : null,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.2),
                blurRadius: 8.0,
              ),
            ]),
        child: isSmall
            ? Row(
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
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Spacer(),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Icon(
                    icon,
                    color: color,
                    size: 40,
                  ),
                  Spacer(),
                  Hero(
                    tag: title,
                    transitionOnUserGestures: true,
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
      ),
    );
  }
}
