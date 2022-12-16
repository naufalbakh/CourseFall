import 'package:dio/dio.dart';
import 'package:banyuwangikuliner/model/course.dart';

class ApiService {
  final String frontEndApi = "http://localhost:3000/frontend";
  final String backEndApi = "http://localhost:3000/backend";
  // final String allApi = "https://www.jsonkeeper.com/b/686H";
  final String allApi = "http://localhost:3000/backend";

  Future<List<Course>> fetchDataCourse() async {
    Response response = await Dio().get(allApi);
    List<Course> courses =
        (response.data as List).map((v) => Course.fromJson(v)).toList();
    return courses;
  }
}
