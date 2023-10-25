import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: SizedBox(
        height: 250,
        child: Card(
          margin: EdgeInsets.all(40),
          child: Center(
              child: FutureBuilder(
            future: controller.data,
            builder: (context, snapshot) {
              var state = snapshot.connectionState;
              if (state != ConnectionState.done) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Text("G bisa");
              } else {
                return Column(
                  children: [
                    Text("User ID : ${snapshot.data!.userId}"),
                    Text("ID : ${snapshot.data!.id}"),
                    Text("Title : ${snapshot.data!.title}"),
                    Text("Completed : ${snapshot.data!.completed}"),
                  ],
                );
              }
            },
          )),
        ),
      ),
    );
  }
}
