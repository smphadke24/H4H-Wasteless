import 'package:flutter/material.dart';
import 'package:h4h/styleguide.dart';
import 'package:h4h/pop_up.dart';

class DealItem extends StatelessWidget {
  final String itemName;
  final String itemDescription;
  final String url;
  final String itemPrice;
  final String itemOldPrice;
  final String store;

  DealItem(
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
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: LightGrey,),
      padding: EdgeInsets.only(
        left: 10,
        right: 25,
        top: 10,
        bottom: 10,
      ),
      margin: EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(url),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(10.0),
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
            width: MediaQuery.of(context).size.width * 0.35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                Text(
                  store,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "\$$itemPrice",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              Text(
                "\$$itemOldPrice",
                style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontStyle: FontStyle.italic,
                    color: Grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
