import 'package:flutter/material.dart';
import 'package:h4h/globalWidgets/searchBar.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:h4h/styleguide.dart';
import 'package:h4h/businessPage/BusinessPage.dart';
import './single_food.dart';
import './single_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:h4h/categories.dart';
import 'package:h4h/globalWidgets/GlobalVars.dart' as Globals;

import 'discover.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext cont) {
    return _buildPage(cont);
  }

  Widget _buildPage(BuildContext context) {
    var info = Globals.info;
    List<Widget> stores = [];
    Globals.stores.forEach((element) {
      stores.add(SingleStore.fromDB(element));
    });
    //print('Will build home.' + Globals.stores.toString());
    return Container(
      padding: EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PreferredSize(
            preferredSize: Size(double.infinity, 100),
            child: Container(
              margin: EdgeInsets.only(bottom: 32.0, top: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        "Hello, ",
                        style: TextStyle(fontSize: 30, color: Colors.black),
                      ),
                      Text(
                        info['name'] + " ",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "Location | ",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: LimeGreen,
                        ),
                      ),
                      Text(
                        info['location'],
                        style: TextStyle(
                          fontSize: 20.0,
                          color: LimeGreen,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SearchBar(),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 15.0),
                child: Icon(Icons.bar_chart_rounded, color: LimeGreen),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  "  Your Stats",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16.0),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                height: 80.0,
                decoration: BoxDecoration(
                  color: DarkGrey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "15% OFF",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Next Reward",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: LimeGreen,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                width: MediaQuery.of(context).size.width * 0.25,
                height: 80.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      (double.tryParse(info['points'])/10).toStringAsFixed(1) + " lbs",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "of food saved",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                margin: EdgeInsets.only(left: 12.0, right: 12.0),
              ),
              CircularPercentIndicator(
                radius: MediaQuery.of(context).size.width * 0.25,
                lineWidth: 10.0,
                percent: double.tryParse(info['points'])/200,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "+" + info['points'] + "pts",
                      style: TextStyle(
                        color: LimeGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      info['points'] + "/200",
                      style: TextStyle(
                        color: LimeGreen,
                      ),
                    ),
                  ],
                ),
                progressColor: LimeGreen,
                backgroundColor: Colors.white,
                animation: true, //animation to show progress at first
                animationDuration: 500,
                circularStrokeCap: CircularStrokeCap.round,
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            children: [
              Container(
                  padding: EdgeInsets.only(bottom: 15.0),
                  child: Icon(
                    Icons.shopping_basket_outlined,
                    color: LimeGreen,
                  )),
              Container(
                margin: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  "  Categories",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16.0),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DiscoverPage("Dairy"),
                      ),
                    );
                  },
                  child: SingleFood("Dairy",
                      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.mitrask.com%2Fwp-content%2Fuploads%2F2018%2F04%2Fdairy-product.png&f=1&nofb=1"),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                     context,
                      MaterialPageRoute(
                        builder: (context) => DiscoverPage("Fruits"),
                      ),
                  );
                },
                child:
                SingleFood("Fruits",
                    "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.searchpng.com%2Fwp-content%2Fuploads%2F2018%2F12%2FFruits-PNG-HD-Transparent-Fruits.png&f=1&nofb=1"),
                ),
                InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DiscoverPage("Vegetables"),
                    ),
                  );
                },
                child: SingleFood("Vegetables",
                    "https://www.kindpng.com/picc/m/599-5999759_fresh-vegetables-png-transparent-png.png"),
                ),
                InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DiscoverPage("Baked Goods"),
                    ),
                  );
                },
                child: SingleFood("Baked Goods",
                    "https://img.pngio.com/bakery-bread-baking-biscuits-png-clipart-baked-goods-baker-bakery-goods-png-728_696.jpg"),

                ),
              ],

            ),
          ),
          SizedBox(height: 16.0),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 15.0),
                child: Icon(Icons.bar_chart_rounded, color: LimeGreen),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  "  Stores Nearby",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16.0),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: stores,
            ),
          ),
        ],
      ),
    );
  }
}
