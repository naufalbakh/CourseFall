// 1. install package dio terlebih dahulu, dan import ke sini
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:banyuwangikuliner/model/resep_model.dart';

// 2. menggunakan asyncronous untuk ambil data api
class Resep1{
  static Future<List<Data>> getDataResep() async {
    Dio dio = Dio();
    var response = await dio.get('http://localhost:3000/resep');
    List<Data> resep = (response.data['data'] as List).map((v) => Data.fromJson(v)).toList();
   return resep;
   
  }
}