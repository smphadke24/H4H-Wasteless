import 'package:flutter/material.dart';
import 'package:h4h/categories.dart';
import '../globalWidgets/searchBar.dart';
import 'package:h4h/businessPage/deals.dart';
import 'package:h4h/styleguide.dart';
import 'package:h4h/globalWidgets/roundedDivider.dart';

/// This is the stateful widget that the main application instantiates.
class BusinessPage extends StatefulWidget {
  @override
  _BusinessPageState createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
            children: [
              _buildHeader(context),
              _buildSearch(context),
              _buildBody(context),
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
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
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
            'Store',
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
            'Location',
            style: TextStyle(
              fontSize: BodyTextSize * 1.3,
              fontFamily: "AvenirMedium",
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  //search bar and shopping icon
  Widget _buildSearch(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            child: SearchBar()
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20.0),
            child: Icon( //shopping bag icon
              Icons.shopping_bag, 
              size: BodyTextSize * 2.5, 
              color: LimeGreen
            ),
          ),
        ],
      )
    );
  }

  //page body
  Widget _buildBody(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  padding: EdgeInsets.only(left: 32, bottom: 15.0),
                  child: Icon(
                    Icons.shopping_basket_outlined,
                    color: LimeGreen,
                  )),
              Container(
                margin: EdgeInsets.only(left: 10.0, bottom: 16.0),
                child: Text(
                  "Select a Food",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16.0),
                ),
              ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(
            left: 32,
            right: 32,
            bottom: 12,
          ),
          child: FoodCategories(context)
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Container(
                padding: EdgeInsets.only(left: 32, bottom: 15.0),
                child: Icon(
                  Icons.money_rounded,
                  color: LimeGreen,
                )),
            Container(
              margin: EdgeInsets.only(left: 10.0, bottom: 16.0),
              child: Text(
                "Avaliable Deals",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16.0
                ),
              ),
            ),
          ],
        ),
        Deals(),
      ],
    ),
    );
  }
}
