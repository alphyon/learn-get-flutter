import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:getExample/controllers/splash_cotroller.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SplashController(),
        builder: (_) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
