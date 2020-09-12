import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getExample/controllers/global_controller.dart';
import 'package:getExample/controllers/socket_client_controller.dart';
import 'package:getExample/pages/reactive_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(GlobalController());
    Get.put(SocketClientController());

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ReactivePage(),
    );
  }
}
