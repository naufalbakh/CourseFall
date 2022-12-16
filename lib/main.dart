import 'package:banyuwangikuliner/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:banyuwangikuliner/view/boarding.dart';
import 'package:banyuwangikuliner/view/home.dart';
import 'package:banyuwangikuliner/view/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: themeData,
      debugShowCheckedModeBanner: false,
      // home : Login(),
      home: Login(),
      // home : dashboardd(),
    );
  }
}
