import 'package:flutter/material.dart';
import 'package:h4h/styleguide.dart';

class SingleFood extends StatelessWidget {
  final String foodName;
  final String url;

  SingleFood(this.foodName, this.url);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      height: 150.0,
      margin: EdgeInsets.only(right: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        color: Colors.grey[200],
      ),
      child: Column(
        children: [
          Container(
            height: 130.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(url),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Text(
            foodName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
