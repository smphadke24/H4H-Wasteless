import 'package:flutter/material.dart';

//Rounded divider line
Widget RoundedDivider(BuildContext context) {
  return Container(
    height: 5,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
    ),
  );
}