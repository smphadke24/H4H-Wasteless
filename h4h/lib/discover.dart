import 'package:flutter/material.dart';
import 'package:h4h/styleguide.dart';
import './globalWidgets/searchBar.dart';
import 'businessPage/deals.dart';
import 'categories.dart';
import 'categories.dart';
import 'styleguide.dart';
import 'styleguide.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
            children: [
              _buildHeader(context),
              _buildSearchBar(context),
              _buildFilterBar(context),
              SizedBox(height: 16),
              Stack(
                children: [
                  Positioned(
                    left: 20,
                    child: Icon(Icons.trending_up, color: LimeGreen, size: BodyTextSize * 2)
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 55),
                    child: Text(
                      "Trending Items",
                      style: TextStyle(
                        fontFamily: "AvenirBlack",
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: BodyTextSize * 1.5
                      ),
                    ),
                  ),
                ],
              ),
              _buildTrendingItems(context),
              SizedBox(height: 16),
              Stack(
                children: [
                  Positioned(
                    left: 20,
                    child: Icon(Icons.money, color: LimeGreen, size: BodyTextSize * 2)
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 55),
                    child: Text(
                      "Other Deals",
                      style: TextStyle(
                        fontFamily: "AvenirBlack",
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: BodyTextSize * 1.5
                      ),
                    ),
                  ),
                ],
              ),
              _buildOtherDeals(context),
            ],
          ),
      ),
    );
  }

  //header
  Widget _buildHeader(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.18, //header approximately 18% of screen height
      width: MediaQuery.of(context).size.width, //header approximately 18% of screen height
      decoration: BoxDecoration(
        color: LimeGreen,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child:  Container(
                margin: EdgeInsets.only(left: 30.0, top: 30.0),
                child: Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
          ),
          Text(
            'Discover nearby deals',
            style: TextStyle(
              fontSize: BodyTextSize * 2,
              fontFamily: "AvenirBlack",
              color: Colors.white,
            ),
          ),   
          Text(
            'Location',
            style: TextStyle(
              fontSize: BodyTextSize * 1.5,
              fontFamily: "AvenirMedium",
              color: Colors.white,
            ),
          ),          
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, //header approximately 18% of screen height
      margin: EdgeInsets.only(top: 10, left: 30, right: 30),
      child: SearchBar(),
    );
  }

  Widget _buildFilterBar(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07, //header approximately 7% of screen height
      width: MediaQuery.of(context).size.width * 0.97, //header approximately 18% of screen height
      decoration: BoxDecoration(
        color: DarkGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //Expiration date 
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: MediumGrey,
            ),
            child: Row(  //Your Stats Label
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 5.0),
                  child: Icon(Icons.calendar_today_rounded, color: Colors.white, size: 14),
                ),
                Container(
                  child: Text(
                    "Expiration Date",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Price
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: MediumGrey,
            ),
            child: Row(  //Your Stats Label
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 5.0),
                  child: Icon(Icons.money_off, color: Colors.white, size: 14),
                ),
                Container(
                  child: Text(
                    "Price",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Category
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: MediumGrey,
            ),
            child: Row(  //Your Stats Label
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 5.0),
                  child: Icon(Icons.fastfood, color: Colors.white, size: 14),
                ),
                Container(
                  child: Text(
                    "Category",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Category
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: MediumGrey,
            ),
            child: Row(  //Your Stats Label
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 5.0),
                  child: Icon(Icons.location_city, color: Colors.white, size: 14),
                ),
                Container(
                  child: Text(
                    "Distance",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrendingItems(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FoodCategories(context),
      ),
    );
  }

  Widget _buildOtherDeals(BuildContext context) {
    return Container(
      child: Deals(),
    );
  }
}
