import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getExample/controllers/reactive_controller.dart';
import 'package:getExample/controllers/socket_client_controller.dart';

class ReactivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final socketController = Get.find<SocketClientController>();
    return GetBuilder<ReactiveController>(
        init: ReactiveController(),
        builder: (_) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CupertinoTextField(
                  onChanged: (value) {
                    socketController.setSearchText(value);
                  },
                ),
                // Obx(
                //   () => Text("Age ${_.myPet.age}"),
                // ),
                Obx(
                  () => Text(socketController.message.value),
                ),
                FlatButton(
                    onPressed: () {
                      print("abc");
                      _.setPetAge(_.myPet.age + 1);
                    },
                    child: Text("add Age"))
              ],
            ),
            // body: Obx(
            //     // () => ListView.builder(
            //     //     itemCount: _.mapItems.length,
            //     //     itemBuilder: (__, index) {
            //     //       final String text = _.mapItems[index];
            //     //       return ListTile(
            //     //         title: Text(text),
            //     //         trailing: IconButton(
            //     //             icon: Icon(Icons.delete),
            //     //             onPressed: () {
            //     //               _.removeItem(index);
            //     //             }),
            //     //       );
            //     //     }),
            //     () => ListView(
            //           children: _.mapItems.values
            //               .map((e) => ListTile(
            //                     trailing: IconButton(
            //                         icon: Icon(Icons.delete),
            //                         onPressed: () {
            //                           _.removeMapItem(e);
            //                         }),
            //                     title: Text(
            //                       e.toString(),
            //                     ),
            //                   ))
            //               .toList(),
            //         )),
            // floatingActionButton: Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     FloatingActionButton(
            //       heroTag: 'Conter',
            //       onPressed: () {
            //         _.addMapItem();
            //       },
            //       child: Icon(Icons.add),
            //     ),
            //     FloatingActionButton(
            //       heroTag: 'Date update',
            //       onPressed: () {
            //         _.getDate();
            //       },
            //       child: Icon(Icons.calendar_today),
            //     ),
            //   ],
            // )
          );
        });
  }
}
