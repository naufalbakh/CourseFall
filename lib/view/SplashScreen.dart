import 'dart:async';

import 'package:banyuwangikuliner/view/boarding.dart';
import 'package:banyuwangikuliner/view/register1.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  void initState() {
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => Boarding())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 23),
          decoration: BoxDecoration(
              image: DecorationImage(
            opacity: 20,
            image: AssetImage("lib/images/food1_33.jpg"),
            fit: BoxFit.cover,
          )),
          // child: BackdropFilter(
          //   filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
          //   ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 36,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 205),
                    Text(
                      "BaKul",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text("Banyuwangi Kuliner",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ))
                  ],
                ),
              ),
              SizedBox(height: 35),

              // SizedBox(height: 10),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
