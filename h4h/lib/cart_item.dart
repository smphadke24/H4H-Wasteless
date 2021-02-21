import 'package:flutter/material.dart';
import 'package:h4h/styleguide.dart';
import 'package:h4h/pop_up.dart';

class CartItem extends StatelessWidget {
  final String itemName;
  final String itemDescription;
  final String url;
  final String itemPrice;
  final String itemOldPrice;
  final String store;

  CartItem(
    this.itemName,
    this.itemDescription,
    this.url,
    this.itemPrice,
    this.itemOldPrice,
    this.store,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: LightGrey,
              ),
              child: Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(url),
                    fit: BoxFit.fitHeight,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => PopUp(
                  url: url,
                  itemName: itemName,
                  description: itemDescription,
                  oldPrice: itemOldPrice,
                  newPrice: itemPrice,
                ),
              );
            },
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                SizedBox(height: 5),
                Text(
                  store + ", 123 Paul's Main Street",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: LimeGreen),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "1x",
                style: TextStyle(fontSize: 14.0, color: Grey),
              ),
              SizedBox(height: 6),
              Text(
                "\$$itemPrice",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: LimeGreen,
                ),
              ),
              Text(
                "\$$itemOldPrice",
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
