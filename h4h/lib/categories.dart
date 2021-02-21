import 'package:flutter/material.dart';
import './single_food.dart';

Widget FoodCategories(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: <Widget>[
        SingleFood("Dairy", "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.mitrask.com%2Fwp-content%2Fuploads%2F2018%2F04%2Fdairy-product.png&f=1&nofb=1"),
        SingleFood("Fruits", "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.searchpng.com%2Fwp-content%2Fuploads%2F2018%2F12%2FFruits-PNG-HD-Transparent-Fruits.png&f=1&nofb=1"),
        SingleFood("Idk", "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcascade.madmimi.com%2Fpromotion_images%2F3055%2F8563%2Foriginal%2FIDK_Logo.png%3F1512750151&f=1&nofb=1"),
      ],
    ),
  );
}