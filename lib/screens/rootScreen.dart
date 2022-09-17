import 'package:flutter/material.dart';
import 'package:karibukwako/utils/env.dart';
import 'package:provider/provider.dart';

import '../pages/homePage.dart';
import '../services/datas.dart';
import '../utils/color.dart';

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
    return Scaffold(
      backgroundColor: appBgColor,
    );
  }

  Widget offline(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Erreur de connection,',
          style: TextStyle(
              color: primary
          ),
        ),

        IconButton(
          onPressed: (){
            setState(() {
              Provider.of<Datas>(context, listen: false).slide(context);
              _refreshcurrIndex = _refreshcurrIndex == 0 ? 1 : 0;
            });
          },
          icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, anim) => RotationTransition(
                turns: child.key == ValueKey('icon1')
                    ? Tween<double>(begin: 1, end: 0.75).animate(anim)
                    : Tween<double>(begin: 0.75, end: 1).animate(anim),
                child: FadeTransition(opacity: anim, child: child),
              ),
              child: _refreshcurrIndex == 0
                  ? Icon(Icons.refresh, color: primary, key: const ValueKey('icon1'))
                  : Icon(
                Icons.refresh_sharp,
                color: primary,
                key: const ValueKey('icon2'),
              )),
        ),
        Text(
          'Actualisé',
          style: TextStyle(
              color: primary
          ),
        )
      ],
    );
  }
}