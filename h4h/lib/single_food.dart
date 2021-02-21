import 'package:flutter/material.dart';
import 'package:h4h/styleguide.dart';

const double MEDIASIZING = 0.14;

class SingleFood extends StatelessWidget {
  final String foodName;
  final String url;

  SingleFood(this.foodName, this.url);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      height: MediaQuery.of(context).size.height * MEDIASIZING,
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
            height: MediaQuery.of(context).size.height * (MEDIASIZING * 0.8),
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
