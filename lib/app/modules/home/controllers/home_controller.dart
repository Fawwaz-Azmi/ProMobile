import 'dart:convert';

import 'package:flutter_application_3/app/data/testing.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  late Future<Testing> data;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    data = getdata();
  }

  Future<Testing> getdata() async {
    var respon = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/todos/5"));
    if (respon.statusCode == 200) {
      return Testing.fromJson(json.decode(respon.body));
    } else {
      throw Exception("error bro");
    }
  }

  void increment() => count.value++;
}
