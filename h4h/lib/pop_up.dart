import 'package:flutter/material.dart';
import 'package:h4h/styleguide.dart';

class PopUp extends StatelessWidget {
  final String url;
  final String itemName;
  final String expirationDate;
  final String store;
  final String description;
  final String oldPrice;
  final String newPrice;
  final String savesWasteOz;

  PopUp({
    this.url,
    this.itemName,
    this.expirationDate,
    this.store,
    this.description,
    this.oldPrice,
    this.newPrice,
    this.savesWasteOz,
  });

  @override
  Widget build(BuildContext context) {
    return new Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
        ),
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              url,
              height: 250,
            ),
            Container(
              margin: EdgeInsets.only(
                top: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    itemName,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "ADD EXPIRATION VARIABLE",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: LimeGreen,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "ADD LOCATION VARIABLE",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: LimeGreen,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 18.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.",
                      style: TextStyle(
                          fontSize: 15.0, color: Grey, height: 1.7),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 18.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\$ $oldPrice",
                        style: TextStyle(
                          color: Grey,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      Text(
                        "\$ $newPrice",
                        style: TextStyle(
                          color: LimeGreen,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3.0,
                            color: LimeGreen,
                            style: BorderStyle.solid,
                          ),
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "16oz",
                              style: TextStyle(
                                color: LimeGreen,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              "saved",
                              style: TextStyle(
                                color: LimeGreen,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(
                          right: 20.0,
                        ),
                      ),
                      Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3.0,
                            color: LimeGreen,
                            style: BorderStyle.solid,
                          ),
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "+16",
                              style: TextStyle(
                                color: LimeGreen,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              "points",
                              style: TextStyle(
                                color: LimeGreen,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 60.0,
              margin: EdgeInsets.only(top: 40.0),
              child: RaisedButton(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                color: LimeGreen,
                onPressed: () {},
                child: Text(
                  "Add to Cart",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 60.0,
              margin: EdgeInsets.only(top: 8.0),
              child: RaisedButton(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    side: BorderSide(color: LimeGreen, width: 3.0)),
                color: Colors.white,
                onPressed: () {Navigator.pop(context);},
                child: Text(
                  "Close",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: LimeGreen,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
