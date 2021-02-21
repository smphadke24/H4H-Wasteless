import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:h4h/styleguide.dart';
import 'package:h4h/globalWidgets/GlobalVars.dart' as Globals;

import './home.dart';
import './login.dart';
import './businessPage/businessPage.dart';
import './cart.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      home: MyApp(), //Login(),
    ),
  );
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  _UPLOADDATA() async {
    List<Map<String, dynamic>> myData1 = [
      {'name': 'A2 Organic Milk', 'newprice': '3.99', 'oldprice': '4.99', 'expiry': '2/24/2021',
        'sdescription': 'MILK!', 'ldescription': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.',
        'store': 'Whole Foods', 'location': 'Cupertino, CA', 'ozFoodSaved': '16'},

      {'name': 'Organic White Bread', 'newprice': '3.99', 'oldprice': '4.99', 'expiry': '2/25/2021',
        'sdescription': 'Fluffy White Bread!', 'ldescription': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.',
        'store': 'Whole Foods', 'location': 'Cupertino, CA', 'ozFoodSaved': '36'},

      {'name': 'Organic Swiss Cheese', 'newprice': '3.99', 'oldprice': '4.99', 'expiry': '2/24/2021',
        'sdescription': 'Sliced cheese', 'ldescription': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.',
        'store': 'Whole Foods', 'location': 'Cupertino, CA', 'ozFoodSaved': '16'},

      {'name': 'Chobani Greek Yogurt', 'newprice': '5.99', 'oldprice': '6.99', 'expiry': '2/23/2021',
        'sdescription': 'Quality, organic yogurt', 'ldescription': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.',
        'store': 'Whole Foods', 'location': 'Cupertino, CA', 'ozFoodSaved': '36'},

      {'name': 'French Bread', 'newprice': '4.99', 'oldprice': '5.99', 'expiry': '2/27/2021',
        'sdescription': 'Oui oui baguette', 'ldescription': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.',
        'store': 'Whole Foods', 'location': 'Cupertino, CA', 'ozFoodSaved': '48'},

      {'name': 'Chocolate Croissants', 'newprice': '3.99', 'oldprice': '5.99', 'expiry': '2/22/2021',
        'sdescription': 'Dark chocolate croissants', 'ldescription': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.',
        'store': 'Whole Foods', 'location': 'Cupertino, CA', 'ozFoodSaved': '32'},

      {'name': 'Organic Oranges', 'newprice': '2.99', 'oldprice': '3.99', 'expiry': '2/25/2021',
        'sdescription': 'Fresh Navel Oranges', 'ldescription': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.',
        'store': 'Whole Foods', 'location': 'Cupertino, CA', 'ozFoodSaved': '36'},

      {'name': 'Organic Pineapples', 'newprice': '4.49', 'oldprice': '5.99', 'expiry': '2/23/2021',
        'sdescription': 'Dole Pineapples', 'ldescription': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.',
        'store': 'Whole Foods', 'location': 'Cupertino, CA', 'ozFoodSaved': '36'},

      {'name': 'Blueberries', 'newprice': '4.99', 'oldprice': '5.99', 'expiry': '2/27/2021',
        'sdescription': 'Locally grown blueberries', 'ldescription': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.',
        'store': 'Whole Foods', 'location': 'Cupertino, CA', 'ozFoodSaved': '26'},

      {'name': 'Organic Corn', 'newprice': '2.99', 'oldprice': '3.99', 'expiry': '2/23/2021',
        'sdescription': "Who doesn't like corn?", 'ldescription': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.',
        'store': 'Whole Foods', 'location': 'Cupertino, CA', 'ozFoodSaved': '16'},

      {'name': 'Organic Spinach', 'newprice': '3.99', 'oldprice': '4.99', 'expiry': '2/26/2021',
        'sdescription': 'Locally grown', 'ldescription': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.',
        'store': 'Whole Foods', 'location': 'Cupertino, CA', 'ozFoodSaved': '16'},
    ];

    myData1.forEach((element) {
      var temp = FirebaseFirestore.instance.collection('stores').doc('').collection('listings').doc();
      //var temp = FirebaseFirestore.instance.collection('foodCategories').doc('Dairy').collection('listings').doc();
      element.forEach((key, value) {
        temp.set(
            {key: value}, SetOptions(merge: true));
      });
    });
  }

  Future<Map<String, String>> _getHomeInfo() async {
    var map = Map<String, String>();
    var temp = await firestore.collection('users').doc(Globals.email).get();
    temp.data().forEach((key, value) {
      map[key] = value.toString();
    });
    return map;
  }

  @override
  Widget build(BuildContext context) {
    //_UPLOADDATA();
    return FutureBuilder(
        future: _getHomeInfo(),
        builder: (context, AsyncSnapshot<Map<String, String>> snapshot) {
          if (snapshot.hasData) {
            return _build(snapshot.data);
          } else {
            return Container(
              margin: EdgeInsets.all(40),
              child: CircularProgressIndicator(),
            );
          }
        }
    );
  }

  Widget _build(Map<String, String> map) {
    Globals.info = map;
    return MaterialApp(
      title: _title,
      theme: ThemeData(fontFamily: "Lato"),
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    BusinessPage(),
    Text(
      'Index 2: School',
    ),
    Cart(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 100.0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_rounded),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: 'Cart',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: LimeGreen,
        unselectedItemColor: Grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
