import 'package:flutter/material.dart';
import 'package:banyuwangikuliner/model/resep_model.dart';

class MyWidget extends StatefulWidget {
  final Resep data;
  Future<List<Data>> fetchData;

  MyWidget({required this.data, required this.fetchData, super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
