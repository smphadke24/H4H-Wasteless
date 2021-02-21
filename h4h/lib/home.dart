import 'package:flutter/material.dart';
import 'package:h4h/globalWidgets/searchBar.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:h4h/styleguide.dart';
import 'package:h4h/businessPage/BusinessPage.dart';
import './single_food.dart';
import './single_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
import 'package:h4h/categories.dart';
import 'package:h4h/globalWidgets/GlobalVars.dart' as Globals;

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<Map<String, String>> _getHomeInfo() async {
    var map = Map<String, String>();
    var temp = await firestore.collection('users').doc(Globals.email).get();
    temp.data().forEach((key, value) {
      map[key] = value.toString();
    });
    return map;
  }

  @override
  Widget build(BuildContext cont) {
    return FutureBuilder(
        future: _getHomeInfo(),
        builder: (context, AsyncSnapshot<Map<String, String>> snapshot) {
          if (snapshot.hasData) {
            return _buildPage(cont, snapshot.data);
          } else {
            return Container(
              margin: EdgeInsets.all(40),
              child: CircularProgressIndicator(),
            );
          }
        }
    );
  }

  Widget _buildPage(BuildContext context, Map<String, String> info) {
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
              Container(
                decoration: BoxDecoration(
                  color: LimeGreen,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                width: MediaQuery.of(context).size.width * 0.25,
                height: 80.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "X,XXX lbs",
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
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                height: 80.0,
                decoration: BoxDecoration(
                  color: Grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
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
                      "Redeem Now",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
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
                        builder: (context) => BusinessPage(),
                      ),
                    );
                  },
                  child: SingleFood("Dairy",
                      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.mitrask.com%2Fwp-content%2Fuploads%2F2018%2F04%2Fdairy-product.png&f=1&nofb=1"),
                ),
                SingleFood("Fruits",
                    "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.searchpng.com%2Fwp-content%2Fuploads%2F2018%2F12%2FFruits-PNG-HD-Transparent-Fruits.png&f=1&nofb=1"),
                SingleFood("Idk",
                    "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcascade.madmimi.com%2Fpromotion_images%2F3055%2F8563%2Foriginal%2FIDK_Logo.png%3F1512750151&f=1&nofb=1"),
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
              children: <Widget>[
                SingleStore(
                    "QFC",
                    "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Frmkcdn.successfactors.com%2F2fb422b4%2Fc21f58b6-2354-4e38-8f41-8.jpg&f=1&nofb=1",
                    "123 Elmo Way"),
                SingleStore(
                    "Safeway",
                    "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fa57.foxnews.com%2Fa57.foxnews.com%2Fstatic.foxnews.com%2Ffoxnews.com%2Fcontent%2Fuploads%2F2018%2F09%2F640%2F320%2F1862%2F1048%2Fistock-485238536.jpg%3Fve%3D1%26tl%3D1%3Fve%3D1%26tl%3D1&f=1&nofb=1",
                    "123 Elmo Way"),
                SingleStore(
                    "QFC",
                    "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Frmkcdn.successfactors.com%2F2fb422b4%2Fc21f58b6-2354-4e38-8f41-8.jpg&f=1&nofb=1",
                    "123 Elmo Way"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
