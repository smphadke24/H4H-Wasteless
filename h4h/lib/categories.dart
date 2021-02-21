import 'package:flutter/material.dart';
import './single_food.dart';

Widget FoodCategories(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: <Widget>[
        SingleFood("Dairy",
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.mitrask.com%2Fwp-content%2Fuploads%2F2018%2F04%2Fdairy-product.png&f=1&nofb=1"),
        SingleFood("Fruits",
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.searchpng.com%2Fwp-content%2Fuploads%2F2018%2F12%2FFruits-PNG-HD-Transparent-Fruits.png&f=1&nofb=1"),
        SingleFood("Vegetables",
        "https://www.kindpng.com/picc/m/599-5999759_fresh-vegetables-png-transparent-png.png"),
        SingleFood("Baked Goods",
        "https://img.pngio.com/bakery-bread-baking-biscuits-png-clipart-baked-goods-baker-bakery-goods-png-728_696.jpg"),
      ],
    ),
  );
}