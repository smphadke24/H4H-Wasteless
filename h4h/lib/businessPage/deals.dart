import 'package:flutter/material.dart';
import 'package:h4h/styleguide.dart';
import 'package:h4h/pop_up.dart';
import 'package:h4h/globalWidgets/GlobalVars.dart' as Globals;

class Deal {
  String itemName;
  String itemDescription;
  String url;
  String itemPrice;
  String itemOldPrice;
  String store;
  String expiry;
  String oz;

  Deal(this.itemName, this.itemDescription, this.url, this.itemPrice,
      this.itemOldPrice, this.store, this.expiry);

  Deal.fromMap(Map<String, dynamic> map)
    : itemName = map['name'].toString(),
      oz = map['ozFoodSaved'],
      itemDescription = map['sDescription'].toString(),
      itemPrice = map['newprice'].toString(),
      itemOldPrice = map['oldprice'].toString(),
      store = map['store'].toString() + " - " + map['location'].toString(),
      expiry = map['expiry'].toString(),
      url = map['url'].toString() ??
          "https://lh3.googleusercontent.com/proxy/OxgJrFW4vZ3FM-h4xJukhQInsEnrNS5jpNUvlgherKEDf9AU2Aj8LxWRqGLJBTYtcTBPqCqMaWzgX9dVOIQb9gWvfSQG2DW6bYZ-Vmslwa3L1Kl499O29yprBkH9QT3I";
}

class Deals extends StatefulWidget {
  String store = "";
  bool t;

  Deals.forStore(String s, bool t) {
    store = s;
    this.t = t;
  }

  @override
  _DealsState createState() => _DealsState(store, t);
}

class _DealsState extends State<Deals> {
  var store = "";
  bool t = false;
  List<Map<String, dynamic>> filtered = [];
  _DealsState(this.store, this.t);

  Widget build(BuildContext context) {
    if (store != "ALL") {
      for (int i = 0; i < Globals.products.length; i++) {
        if (Globals.products[i]['store'] == store) {
          filtered.add(Globals.products[i]);
        }
      }
    } else {
      filtered = Globals.products;
    }
    return Container(
      child: SingleChildScrollView(child: _buildList(context, t)),
    );
  }

  Widget _buildList(BuildContext context, bool t) {
    double x = MediaQuery.of(context).size.height * 0.29;
    if (t) { x = MediaQuery.of(context).size.height * 0.40; }
    return Container(
      height: x,
      margin: EdgeInsets.only(left: 22, right: 32, bottom: 22),
      padding: const EdgeInsets.all(8),
      child: ListView(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        children: filtered.map((deal) => _buildTile(context, deal)).toList(),
      ),
    );
  }

  Widget _buildTile(BuildContext context, var deal) {
    dynamic currentDeal = Deal.fromMap(deal);

    return Container(
      height: 120,
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.only(bottom: 22),
      decoration: BoxDecoration(
        color: LightGrey,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width - 30) * 0.6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentDeal.itemName,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width - 30) * 0.2,
                    height: 20,
                    decoration: BoxDecoration(
                      color: DarkGrey,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text(
                        currentDeal.itemDescription,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: BlueGrey),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\$" + currentDeal.itemOldPrice,
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontSize: 14.0,
                    ),
                  ),
                  Text(
                    "\$" + currentDeal.itemPrice,
                    style: TextStyle(
                      color: LimeGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
              Text(
                "Expiration: " + currentDeal.expiry,
                style: TextStyle(color: LimeGreen),
              ),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => PopUp(
                      url: currentDeal.url,
                      itemName: currentDeal.itemName,
                      description: currentDeal.itemDescription,
                      oldPrice: currentDeal.itemOldPrice.toString(),
                      newPrice: currentDeal.itemPrice.toString(),
                      expirationDate: currentDeal.expiry,
                      store: currentDeal.store,
                      savesWasteOz: currentDeal.oz,
                    ),
                  );
                },
                child: Container(
                  width: 25.0,
                  height: 25.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: LimeGreen,
                  ),
                  child: Icon(
                    Icons.add_rounded,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
// // filtered.map((deal) => _buildTile(context, deal)).toList(),
//   Widget _buildTile(BuildContext context, var deal) {
//     dynamic currentDeal = Deal.fromMap(deal);

//     return InkWell(
//       onTap: () {
//         showDialog(
//           context: context,
//           builder: (BuildContext context) => PopUp(
//             url:
//                 "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.commitpoint.com%2Fassets%2Fimages%2Fproducts.png&f=1&nofb=1",
//             itemName: currentDeal.itemName,
//             description: currentDeal.itemDescription,
//             oldPrice: currentDeal.itemOldPrice.toString(),
//             newPrice: currentDeal.itemPrice.toString(),
//             expirationDate: currentDeal.expiry,
//             store: currentDeal.store,
//             savesWasteOz: currentDeal.oz,
//           ),
//         );
//       },
//       child: Container(
//         width: MediaQuery.of(context).size.width * 0.8,
//         height: MediaQuery.of(context).size.width * 0.3,
//         margin: EdgeInsets.all(5),
//         decoration: BoxDecoration(
//           color: LightGrey,
//           borderRadius: RoundedBox,
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               padding: EdgeInsets.only(top: 3, left: 8, right: 8),
//               child: Text(
//                 currentDeal.itemName, // + " " + currentDeal.itemDescription,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   height: 1.2,
//                   fontFamily: "AvenirMedium",
//                   fontSize: BodyTextSize,
//                   fontWeight: FontWeight.w900,
//                 ),
//               ),
//             ),
//             Container(
//               alignment: Alignment.bottomLeft,
//               padding: EdgeInsets.only(left: 10.0, top: 15.0, right: 10.0),
//               child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "\$" + currentDeal.itemPrice.toString(),
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                         fontFamily: "AvenirMedium",
//                         fontSize: BodyTextSize * 1.25,
//                         fontWeight: FontWeight.w900,
//                         color: LimeGreen,
//                       ),
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: LimeGreen,
//                       ),
//                       child: Icon(
//                         Icons.add,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ]),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
