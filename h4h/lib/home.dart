import 'package:flutter/material.dart';
import 'package:h4h/globalWidgets/searchBar.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:h4h/styleguide.dart';
import './single_store.dart';
import 'categories.dart';
import 'styleguide.dart';
import 'styleguide.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32.0),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          SearchBar(),
          Row(  //Your Stats Label
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 15.0),
                child: Icon(Icons.bar_chart_rounded, color: LimeGreen),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0, bottom: 16.0),
                child: Text(
                  "Your Stats",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16.0),
                ),
              ),
            ],
          ),
          _buildStats(context),
          SizedBox(height: 16.0),
          Row(  //Food Categories Label
            children: [
              Container(
                  padding: EdgeInsets.only(bottom: 15.0),
                  child: Icon(
                    Icons.shopping_basket_outlined,
                    color: LimeGreen,
                  )),
              Container(
                margin: EdgeInsets.only(left: 10.0, bottom: 16.0),
                child: Text(
                  "Categories",
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
            child: FoodCategories(context),
          ),
          SizedBox(height: 16.0),
          Row(  //Stores Nearby label
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 15.0),
                child: Icon(Icons.bar_chart_rounded, color: LimeGreen),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0, bottom: 16.0),
                child: Text(
                  "Stores Nearby",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16.0),
                ),
              ),
            ],
          ),
          _buildNearbyStores(context),
        ],
      ),
    );
  }
  
  Widget _buildHeader(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(double.infinity, 100),
      child: Container(
        margin: EdgeInsets.only(bottom: 32.0, top: 32.0),
        child: Stack(
          children: [
            Positioned(
              top: 8,
              right: 8,
              child: Icon(                    
                Icons.shopping_bag, 
                size: BodyTextSize * 4,
                color: LimeGreen
              ),
            ),
            Positioned(
              right: 4,
              top: 14,
              child: Container(
                width: 20,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: DarkGrey,
                ),
                child: Text(
                  '15', 
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: BodyTextSize),
                  ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      "Hello, ",
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                    Text(
                      "Susan ",
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
                      "Santa Clara, CA",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: LimeGreen,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStats(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularPercentIndicator(
          radius: MediaQuery.of(context).size.width * 0.22,
          lineWidth: 10.0,
          percent: 0.7,
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "+140pts",
                style: TextStyle(
                  color: LimeGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              Text(
                "140/200",
                style: TextStyle(
                  color: LimeGreen,
                  fontSize: 12.0,
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
          height: MediaQuery.of(context).size.height * 0.1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "XXX lbs",
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
          height: MediaQuery.of(context).size.height * 0.1,
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
    );
  }
  
  Widget _buildNearbyStores(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          SingleStore(
              "QFC",
              "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Frmkcdn.successfactors.com%2F2fb422b4%2Fc21f58b6-2354-4e38-8f41-8.jpg&f=1&nofb=1",
              "123 Elmo Way"
          ),
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
    );
  }
}
