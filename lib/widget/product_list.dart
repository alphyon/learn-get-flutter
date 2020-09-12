import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getExample/controllers/global_controller.dart';
import 'package:getExample/models/product.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<GlobalController>();
    return GetBuilder<GlobalController>(
      id: 'products',
      builder: (_) => ListView.builder(
        itemBuilder: (__, index) {
          final Product product = _.products[index];
          print(product.toString());
          return ListTile(
            title: Text(product.name),
            subtitle: Text("USD ${product.price}"),
            trailing: IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: product.isFavorite ? Colors.blue : Colors.grey,
                ),
                onPressed: () {
                  _.onFavorite(index, !product.isFavorite);
                }),
          );
        },
        itemCount: _.products.length,
      ),
    );
  }
}
