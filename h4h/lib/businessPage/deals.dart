import 'package:flutter/material.dart';
import 'package:h4h/styleguide.dart';
import 'package:h4h/pop_up.dart';

import '../styleguide.dart';
import '../styleguide.dart';
import '../styleguide.dart';

/* TEMP LIST OF DEALS */
List testDeals = [
  {"brand": "Smith Brothers", "item": "1% Milk", "price": 2.00},
  {"brand": "Dole", "item": "Premium Bananas", "price": 0.99},
  {"brand": "Tyson", "item": "Grilled Asparagus", "price": 1.49},
  {"brand": "Beecher's", "item": "Cheddar Cheese", "price": 1.50},
  {"brand": "Kringle's Best", "item": "Croisants", "price": 2.60},
  {
    "brand": "Evergreen",
    "item": "Broccoli Flotteretes",
    "price": 0.70,
  },
  {
    "brand": "Jif",
    "item": "Creamy Peanut Butter",
    "price": 2.00,
  },
  {
    "brand": "Bush's",
    "item": "Baked Beans",
    "price": 0.82,
  },
  {
    "brand": "Folgers",
    "item": "Special Roast Coffee",
    "price": 3.28,
  },
  /*
  {
    "brand": "",
    "item": "",
    "price": ,
  },
  */
];

class Deals extends StatefulWidget {
  @override
  _DealsState createState() => _DealsState();
}

class _DealsState extends State<Deals> {
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(child: _buildList(context)),
    );
  }

  Widget _buildList(BuildContext context) {
    return Container(
      child: ListView(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        children: testDeals.map((deal) => _buildTile(context, deal)).toList(),
      ),
    );
  }

  Widget _buildTile(BuildContext context, var deal) {
    dynamic currentDeal = Deal.fromMap(deal);

    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => PopUp(
            url: "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.commitpoint.com%2Fassets%2Fimages%2Fproducts.png&f=1&nofb=1",
            itemName: currentDeal.item,
            description: "BLAH BLAU BALFEHIUEWHFWEFNIJKEWNFLWENIF",
            oldPrice: currentDeal.price.toString(),
            newPrice: currentDeal.price.toString(),
          ),
        );
      },
      child: Container(
        //sizing of deals squares
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.width * 0.3,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: LightGrey,
          borderRadius: RoundedBox,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(  //item brand and name
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                    currentDeal.brand + " " + currentDeal.item,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: "AvenirMedium",
                      fontSize: BodyTextSize * 1.5,
                      fontWeight: FontWeight.w900,
                    ),
                    ),
                  ),
                ),
                Align(
                  child: Container(
                    width: 60,
                    height: 20,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      color: DarkGrey,
                      borderRadius: RoundedBox,
                    ),
                    child: Text(
                      'TYPE',
                      style: TextStyle(color: Colors.white, fontSize: BodyTextSize),
                    ),
                  ),
                ),
              ],
            ),
            Align(  //item description
              alignment: Alignment.topLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 100),
                  child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: "AvenirMedium",
                    fontSize: BodyTextSize,
                  ),
                ),
              ),
            ),
            Container(  //pricing
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.only(left: 20.0, top: 15.0, right: 20.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$" + currentDeal.price.toStringAsFixed(2),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: "AvenirMedium",
                        fontSize: BodyTextSize * 1.5,
                        fontWeight: FontWeight.w900,
                        color: LimeGreen,
                      ),
                    ),
                    Container(  //plus button
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: LimeGreen,
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

//TODO: Eventually connect to Firebase
class Deal {
  final String brand;
  final String item;
  final double price;

  Deal.fromMap(Map<String, dynamic> map)
      : assert(map['brand'] != null),
        assert(map['item'] != null),
        assert(map['price'] != null),
        brand = map['brand'],
        item = map['item'],
        price = map['price'];

  @override
  String toString() => "Match<$brand:$price>";
}
