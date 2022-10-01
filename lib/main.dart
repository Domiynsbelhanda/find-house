import 'dart:io';

import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:karibukwako/screens/carouselScreen.dart';
import 'package:karibukwako/screens/rootScreen.dart';
import 'package:karibukwako/services/auth.dart';
import 'package:karibukwako/services/datas.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=> Auth()),
          ChangeNotifierProvider(create: (context)=> Datas())
        ],
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    Provider.of<Datas>(context, listen: false).slide(context);
    Provider.of<Datas>(context, listen: false).homeLoc(context);
    return MaterialApp(
      title: 'Karibu Kwako',
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          )),
      home: AnimatedSplashScreen(
        nextScreen: CarouselScreen(),
        duration: 2500,
        splash: "assets/images/text.png",
        backgroundColor : Colors.white
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
