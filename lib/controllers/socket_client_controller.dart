import 'dart:async';

import 'package:faker/faker.dart';
import 'package:flutter/animation.dart';
import 'package:get/state_manager.dart';

class SocketClientController extends GetxController {
  RxString _message = "".obs;
  RxInt _counter = 0.obs;
  Timer _timer, _timerCounter;
  final _faker = Faker();

  RxString _searchText = "".obs;

  RxString get message => _message;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  _init() {
    //worker para que se ejecute siempre
    // ever(_searchText, (_) {
    //   print("text test");
    // });

//worker para una sola ejecucion
    // once(_counter, (_) {
    //   print("_counter once has been changed ${_counter.value}");
    // });

//Worker para definicion de un delay en la ejecucion
    // debounce(
    //   _searchText,
    //   (_) {
    //     print(_searchText.value);
    //   },
    //   time: Duration(milliseconds: 500),
    // );

//Worker que se ejecuta en el intervalo de tiempo definido
    interval(
      _searchText,
      (_) {
        print(_searchText.value);
      },
      time: Duration(milliseconds: 500),
    );

    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      _message.value = _faker.lorem.sentence();
    });

    // _timerCounter = Timer.periodic(Duration(seconds: 1), (timer) {
    //   _counter.value++;
    // });
  }

  @override
  FutureOr onClose() {
    if (_timer != null) {
      _timer.cancel();
    }
    // if (_timerCounter != null) {
    //   _timerCounter.cancel();
    // }
    return super.onClose();
  }

  void setSearchText(String search) {
    _searchText.value = search;
  }
}
