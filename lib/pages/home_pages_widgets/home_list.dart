import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:getExample/controllers/home_controller.dart';
import 'package:getExample/models/user.dart';

class HomeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: 'users',
        builder: (_) {
          if (_.loading) {
            return Center(
              child: LinearProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: _.users.length,
                itemBuilder: (context, index) {
                  final User user = _.users[index];
                  return ListTile(
                    title: Text(user.firstName),
                    subtitle: Text(user.lastName),
                    onTap: () => _.showUserProfile(user),
                  );
                });
          }
        });
  }
}
