import 'package:flutter/material.dart';
import 'package:karibukwako/pages/homePage.dart';
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

class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Karibu Kwako',
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          )),
      home: HomePage(),
    );
  }

  @override
  void initState() {
    Provider.of<Datas>(context, listen: false).slide(context);
  }
}
