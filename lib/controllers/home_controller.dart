import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:getExample/api/users_api.dart';
import 'package:getExample/models/user.dart';
import 'package:getExample/pages/profile_page.dart';

class HomeController extends GetxController {
  int _counter = 0;
  List<User> _users = [];
  bool _loading = true;
  int get counter => _counter;
  List<User> get users => _users;
  bool get loading => _loading;

  @override
  void onInit() {
    super.onInit();
    print("same as init state");
  }

  @override
  void onReady() {
    super.onReady();
    print("Render");
    this.loadUsers();
  }

  Future<void> loadUsers() async {
    final data = await UsersApi.instance.getUsers(1);
    this._users = data;
    this._loading = false;
    update(['users']);
  }

  void increment() {
    this._counter++;
    update(['text'], _counter >= 10);
  }

  showUserProfile(User user) async {
    final result = await Get.to<String>(
      ProfilePage(),
      arguments: user,
    );
    if (result != null) {
      print("result $result");
    }
  }
}
