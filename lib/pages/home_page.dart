import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:getExample/controllers/global_controller.dart';
import 'package:getExample/controllers/home_controller.dart';
import 'package:getExample/widget/product_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                GetBuilder<GlobalController>(
                    id: 'favorites',
                    builder: (_) => FlatButton(
                        onPressed: () {},
                        child: Text("Favoritos (${_.favorites.length})")))
              ],
            ),
            body: ProductList(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                _.increment();
              },
              child: Icon(Icons.add),
            ),
          );
        });
  }
}
