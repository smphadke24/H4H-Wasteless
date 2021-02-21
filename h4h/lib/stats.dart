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
import 'package:h4h/globalWidgets/roundedDivider.dart';

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

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
                  'My Impact',
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
                  'How I make the world a better place',
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
          SizedBox(height: 25),
          Container(
            height: 150,
            padding: EdgeInsets.all(16.0),
            width: MediaQuery.of(context).size.width - 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[200],
                  offset: const Offset(
                    0.0,
                    0.0
                  ),
                  blurRadius: 8.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Amount of money you saved",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "\$694.20",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          children: [
                            Text(
                              "+ 2.3%",
                              style: TextStyle(
                                color: LimeGreen,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              "  than last year",
                              style: TextStyle(
                                color: DarkGrey,
                                fontSize: 13.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    SizedBox(
                      width: 165,
                      child: Image.network(
                        "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.pngmart.com%2Ffiles%2F7%2FGraph-Transparent-Background.png&f=1&nofb=1",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Container(
            margin: EdgeInsets.only(
              left: 32,
            ),
            child: Row(
              children: [
                Container(
                  height: 150,
                  padding: EdgeInsets.all(8.0),
                  width: (MediaQuery.of(context).size.width - 64 - 25) * 0.5,
                  decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[200],
                  offset: const Offset(
                    0.0,
                    0.0
                  ),
                  blurRadius: 8.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Most Common Purchase",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Container(
                        height: 50,
                        child: Image.network(
                          "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fpnommensen.com%2Fimages%2Fapples-transparent-3.png&f=1&nofb=1",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      SizedBox(height: 6.0),
                      Text(
                        "Fruits",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: LimeGreen,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.only(
                    left: 25,
                  ),
                  width: (MediaQuery.of(context).size.width - 64 - 25) * 0.5,
                  decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[200],
                  offset: const Offset(
                    0.0,
                    0.0
                  ),
                  blurRadius: 8.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Total Items Purchased",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        "250",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: LimeGreen,
                          fontSize: 35.0,
                        ),
                      ),
                      SizedBox(height: 6.0),
                      Column(
                        children: [
                          Text(
                            "+ 8.3%",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: LimeGreen,
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            "than last year",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: DarkGrey,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Container(
            height: 150,
            padding: EdgeInsets.all(16.0),
            width: MediaQuery.of(context).size.width - 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[200],
                  offset: const Offset(
                    0.0,
                    0.0
                  ),
                  blurRadius: 8.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Global Food Savings",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 12.0),
                Text(
                  "Your food savings contribute to helping the globe fight unnecessary food waste!",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: DarkGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12.0),
                Text(
                  "5,000,000 lbs",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 30.0,
                    color: LimeGreen,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
