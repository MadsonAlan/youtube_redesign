import 'package:flutter/material.dart';
import 'package:youtube_redesign/Home.dart';
import 'package:youtube_redesign/telas/MenuUser.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> with SingleTickerProviderStateMixin {
  AnimationController controller;

  Animation animationTranslate;
  Animation animationSize;
  Animation animationSizeBorder;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 230), vsync: this);

    animationTranslate = Tween(begin: 0.0, end: 300.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    animationTranslate.addListener(() {
      setState(() {});
    });

    animationSize = Tween(begin: 1.0, end: 0.8)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    animationSize.addListener(() {
      setState(() {});
    });

    animationSizeBorder = Tween(begin: 0.0, end: 10.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    animationSizeBorder.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  _onTapMenu() {
    if (controller.value == 1) {
      controller.reverse();
    } else {
      controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        MenuUser(
          onTap: _onTapMenu,
        ),
        Transform.scale(
          scale: animationSize.value,
          child: Container(
              transform: Matrix4.identity()
                ..translate(animationTranslate.value, 0.0),
              child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(animationSizeBorder.value),
                  child: Home(
                    onTap: _onTapMenu,
                  ))),
        ) //widget do drawer
      ],
    );
  }
}
