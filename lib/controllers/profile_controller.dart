import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:getExample/models/user.dart';

class ProfileController extends GetxController {
  User _user;
  User get user => _user;
  String _inputText = '';

  @override
  void onInit() {
    super.onInit();
    this._user = Get.arguments as User;
  }

  void onInputTextChange(String text) {
    this._inputText = text;
  }

  void gotoBackWithData() {
    if (this._inputText.trim().length > 0) {
      Get.back(result: _inputText);
    } else {
      if (GetPlatform.isIOS) {
        showCupertinoDialog(
            context: Get.overlayContext,
            builder: (_) => CupertinoActionSheet(
                  title: Text("Error"),
                  message: Text("campos vacios"),
                  cancelButton: CupertinoActionSheetAction(
                      onPressed: () => Get.back(), child: Text("Aceptar")),
                ));
      } else {
        Get.dialog(
          AlertDialog(
            title: Text("Error"),
            content: Text("campo vacio"),
            actions: [
              FlatButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("ACEPTAR"),
              )
            ],
          ),
        );
      }
    }
  }
}
