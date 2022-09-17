import 'package:flutter/material.dart';
import 'package:karibukwako/utils/env.dart';

import '../pages/homePage.dart';

class RootScreen extends StatefulWidget{
  final int? tab;
  RootScreen({this.tab});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RootScreen();
  }
}

class _RootScreen extends State<RootScreen> with TickerProviderStateMixin{

  int activeTabIndex = 0;
  List barItems = [];
  int _refreshcurrIndex = 0;

  late final AnimationController _controller = AnimationController(
    duration: Duration(milliseconds: Env.ANIMATED_BODY_MS),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.forward();
    activeTabIndex = widget.tab!;

    barItems = [
      {
        "icon": "assets/icons/home.svg",
        "page": HomePage(),
        "text": "Accueil"
      }
    ];
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  animatedPage(page) {
    return FadeTransition(child: page, opacity: _animation);
  }

  void onPageChanged(int index) {
    if (index == activeTabIndex) return;
    _controller.reset();
    setState(() {
      activeTabIndex = index;
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold();
  }
}