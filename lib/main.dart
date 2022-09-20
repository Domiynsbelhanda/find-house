import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:karibukwako/screens/rootScreen.dart';
import 'package:karibukwako/services/auth.dart';
import 'package:karibukwako/services/datas.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
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
      home: RootScreen(
        tab: 0,
        error: false,
      ),
    );
  }
}
