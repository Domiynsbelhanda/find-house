import 'package:flutter/material.dart';
import 'package:karibukwako/screens/rootScreen.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({Key? key}) : super(key: key);

  @override
  State<CarouselScreen> createState() => _CarouselScreen();
}

class _CarouselScreen extends State<CarouselScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RootScreen(
                    tab: 0,
                    error: false,
                  )),
                ),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.blue,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Container(
          decoration: const BoxDecoration(
              color: Color(0xff7c94b6),
              image: DecorationImage(
                  image: AssetImage("assets/images/maison.jpg"),
                  fit: BoxFit.cover,
                  colorFilter:
                  ColorFilter.mode(Colors.black12, BlendMode.darken))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 100, left: 20),
                child: Text("Une maison\nPour votre logement\nde rêve.",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w200,
                        color: Colors.white)),
              )
            ],
          )),
    );
  }
}
