import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:getExample/controllers/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text("${_.user.email}"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${_.user.firstName} ${_.user.lastName}"),
                  Image.network(_.user.avatar),
                  SizedBox(
                    height: 20,
                  ),
                  CupertinoTextField(
                    onChanged: _.onInputTextChange,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CupertinoButton(
                      child: Text("ACEPTAR"), onPressed: _.gotoBackWithData),
                ],
              ),
            ),
          );
        });
  }
}
