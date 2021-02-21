import 'package:flutter/material.dart';
import 'package:h4h/styleguide.dart';
import './cart_item.dart';
import 'package:h4h/globalWidgets/roundedDivider.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height *
                0.18, //header approximately 18% of screen height
            width: MediaQuery.of(context)
                .size
                .width, //header approximately 18% of screen height
            decoration: BoxDecoration(
              color: LimeGreen,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  //divider
                  width: MediaQuery.of(context).size.width * 0.1,
                  margin: EdgeInsets.only(top: 60, bottom: 10),
                  child: RoundedDivider(context),
                ),
                Text(
                  'Shopping Cart',
                  style: TextStyle(
                    fontSize: BodyTextSize * 2,
                    fontFamily: "AvenirMedium",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  'Review your order',
                  style: TextStyle(
                    fontSize: BodyTextSize * 1.3,
                    fontFamily: "AvenirMedium",
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 32, right: 32),
            height: MediaQuery.of(context).size.height * 0.5,
            child: ListView(
              children: [
                CartItem(
                  "Milk",
                  "That good good 2% milk32gwerg",
                  "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fpngimg.com%2Fuploads%2Fmilk%2Fmilk_PNG12732.png&f=1&nofb=1",
                  "1.99",
                  "3.99",
                  "QFC",
                ),
                CartItem(
                  "Milk",
                  "That good good 2% milk32gwerg",
                  "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fpngimg.com%2Fuploads%2Fmilk%2Fmilk_PNG12732.png&f=1&nofb=1",
                  "1.99",
                  "3.99",
                  "QFC",
                ),
                CartItem(
                  "Milk",
                  "That good good 2% milk32gwerg",
                  "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fpngimg.com%2Fuploads%2Fmilk%2Fmilk_PNG12732.png&f=1&nofb=1",
                  "1.99",
                  "3.99",
                  "QFC",
                ),
                CartItem(
                  "Milk",
                  "That good good 2% milk32gwerg",
                  "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fpngimg.com%2Fuploads%2Fmilk%2Fmilk_PNG12732.png&f=1&nofb=1",
                  "1.99",
                  "3.99",
                  "QFC",
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 22.0, bottom: 22.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "+42069 points | 0lb 6oz saved | \$6.90 saved",
                  style: TextStyle(color: Grey, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 5.0,
                width: 40,
                decoration: BoxDecoration(
                  color: LimeGreen,
                  borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
                ),
                margin: EdgeInsets.only(
                  left: 32,
                  bottom: 10,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 32, right: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Subtotal:",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                ),
                Text(
                  "\$4.20",
                  style: TextStyle(
                      color: LimeGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 60.0,
            margin: EdgeInsets.only(top: 22.0),
            child: RaisedButton(
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              color: LimeGreen,
              onPressed: () {},
              child: Text(
                "Add to Instacart",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
