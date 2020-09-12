import 'dart:async';

import 'package:get/get.dart';
import 'package:getExample/controllers/socket_client_controller.dart';
import 'package:getExample/models/pet.dart';

class ReactiveController extends GetxController {
  RxInt counter = 0.obs;
  RxString currentDate = ''.obs;
  RxList<String> items = List<String>().obs;
  RxMap<String, dynamic> mapItems = Map<String, dynamic>().obs;

  Pet myPet = Pet(name: "Shadow", age: 20);

  StreamSubscription<String> _subscription;

  @override
  void onInit() {
    super.onInit();
    final socketController = Get.find<SocketClientController>();
    _subscription = socketController.message.listen((data) {
      print("message:::::: $data");
    });
  }

  @override
  FutureOr onClose() {
    _subscription?.cancel();
    return super.onClose();
  }

  void increment() {
    counter.value++;
  }

  void getDate() {
    currentDate.value = DateTime.now().toString();
  }

  void addItem() {
    items.add(DateTime.now().toString());
  }

  void addMapItem() {
    var stringDate = DateTime.now().toString();
    mapItems.add(stringDate, stringDate);
  }

  void removeItem(int index) {
    items.removeAt(index);
  }

  void removeMapItem(String key) {
    mapItems.remove(key);
  }

  void setPetAge(int age) {
    myPet.age = age;
    // myPet.value = myPet.value.copyWith(age: age);
  }
}
