import 'package:flutter/material.dart';
import 'package:h4h/styleguide.dart';
import './globalWidgets/searchBar.dart';

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
              SearchBar(),
              // _buildSearch(context),
              // _buildBody(context),
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
              fontFamily: "AvenirMedium",
              color: Colors.white,
            ),
          ),          
        ],
      ),
    );
  }
}
