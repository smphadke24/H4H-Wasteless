import 'package:flutter/material.dart';
import 'package:h4h/styleguide.dart';

class SingleStore extends StatelessWidget {
  String storeName;
  String url;
  String address;

  SingleStore(this.storeName, this.url, this.address);

  SingleStore.fromDB(map) {
    this.storeName = map['name'];
    this.url = map['url'];
    this.address = map['location'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      height: 150.0,
      margin: EdgeInsets.only(right: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.srcOver)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              storeName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.white
              ),
            ),
            Container(width: 30.0, height: 2.0, color: Colors.white,margin: EdgeInsets.only(top: 8.0, bottom:16.0)),
            Text(
              address,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.white
              ),
            ),
          ],
        ),
    );
  }
}
