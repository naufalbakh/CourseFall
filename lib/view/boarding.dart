import 'dart:ui';

import 'package:banyuwangikuliner/view/login.dart';
import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';

class Boarding extends StatefulWidget {
  @override
  State<Boarding> createState() => _LoginState();
}

class _LoginState extends State<Boarding> {


  // ThemeData themeData = ThemeData.light();

  // void setTheme(bool isDarkmode) {
  //   setState(() {
  //     themeData = (isDarkmode) ? ThemeData.dark() : ThemeData.light();
  //     SharedPref.pref?.setBool('isDarkmode', isDarkmode);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 23),
        decoration: BoxDecoration(
            image: DecorationImage(
              opacity: 20, 
              image: AssetImage("lib/images/bg.png"),
              fit: BoxFit.cover,
            )
          ),
          // child: BackdropFilter(
          //   filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
          //   ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 16,),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  Image.asset("lib/images/logo.png",height: 300, width: 300,),
                ],
              ),
            ),
            // SizedBox(height: 5),
           
            // Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) => Login(),));
              },
              child: Text("GET STARTED",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                  )),
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 163, 160, 160),
                  minimumSize: Size(100,45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            // SizedBox(height: 10),
            Spacer(),
            
          ],
        ),
      ),
      ),
      
    );
  }
}
