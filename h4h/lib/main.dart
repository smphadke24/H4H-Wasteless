import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:h4h/discover.dart';
import 'package:h4h/styleguide.dart';
import 'package:h4h/globalWidgets/GlobalVars.dart' as Globals;

import './home.dart';
import './businessPage/businessPage.dart';
import './cart.dart';
import 'businessPage/deals.dart';
import 'login.dart';

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

  Future<int> _getHomeInfo() async {
    var map = Map<String, String>();
    var map2 = Map<String, String>();
    var temp = await firestore.collection('users').doc(Globals.email).get();
    print('a');
    var temp2 = await firestore.collection('stores').get();
    DocumentReference temp3;
    print('b');
    temp.data().forEach((key, value) {
      map[key] = value.toString();
    });
    print('a');
    temp2.docs.forEach((element) async {
      temp3 = element.reference;
      var storeMap = Map<String, String>();
      if (element.exists) {
        print('b');
        element.data().forEach((key, value) {
          storeMap[key] = value.toString();
        });
        var t = await temp3.collection('listings').get();
        t.docs.forEach((elt) {
          var myMap = Map<String, dynamic>();
          elt.data().forEach((key, value) {
            myMap[key] = value.toString();
          });
          Globals.products.add(myMap);
        });
      }
      Globals.stores.add(storeMap);
    });

    print('Got info.');
    Globals.info = map;
    Globals.future = true;
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    //_UPLOADDATA();
    return StreamBuilder(
        stream: _getHomeInfo().asStream(),
        builder: (context, AsyncSnapshot<int> snapshot) {
          if (snapshot.hasData || Globals.future) {
            return _build();
          } else {
            return Container(
              margin: EdgeInsets.all(40),
              child: CircularProgressIndicator(),
            );
          }
        }
    );
  }

  Widget _build() {
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
    DiscoverPage(),
    Text(
      'Index 2: School', // TODO - STATS
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
            icon: Icon(Icons.map_rounded),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_rounded),
            label: 'My Stats',
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
