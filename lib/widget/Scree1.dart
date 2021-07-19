import 'package:flutter/material.dart';
import '../models/access_list.dart';
import './Screen2.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class DashBoardFinal extends StatefulWidget {
  @override
  _DashBoardFinalState createState() => _DashBoardFinalState();
}

class _DashBoardFinalState extends State<DashBoardFinal> {
  final String url = "https://api.coincap.io/v2/assets";
  List currencies;

  @override
  void initState() {
    super.initState();
    this.getJasonData();
  }

  Future<String> getJasonData() async {
    var response = await http.get(Uri.parse(Uri.encodeFull(url)),
        headers: {"Accept": "Application/json"});
    setState(() {
      var convertDatatoJson = jsonDecode(response.body);
      currencies = convertDatatoJson['data'];
    });
  }

  String change_percentage;
  bool increase = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent[400],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Crypto Currencies',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: currencies == null ? 0 : currencies.length,
        itemBuilder: (BuildContext context, int index) {
          increase = true;
          if (currencies[index]['changePercent24Hr'][0] == '-') {
            increase = false;
          }
          return Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: Card(
                    shadowColor: Colors.blue[200],
                    child: InkWell(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Details(currencies, index, image)));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 30,
                                    ),
                                    CircleAvatar(
                                      radius: 19,
                                      backgroundColor: Colors.white,
                                      child: Image(
                                        image: AssetImage(
                                          image[(index) % image.length],
                                        ),
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topCenter,
                                      ),
                                    ),
                                    Text(
                                      currencies[index]['symbol'],
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.grey[500],
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      currencies[index]['name'],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Row(
                                children: [
                                  increase == true
                                      ? Icon(
                                          Icons.arrow_drop_up,
                                          color: Colors.green,
                                          size: 30.0,
                                        )
                                      : Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.red,
                                          size: 30.0,
                                        ),
                                  Text(
                                    "${currencies[index]['changePercent24Hr'].substring(0, 5)}%",
                                  ),
                                ],
                              ),
                              Text(
                                "\$${currencies[index]['priceUsd'].substring(0, 7)}",
                                style: TextStyle(
                                  color: Colors.lightGreenAccent[400],
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                            textBaseline: TextBaseline.alphabetic,
                            verticalDirection: VerticalDirection.up,
                          ),
                        ],
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: Colors.black)),
                    borderOnForeground: true,
                    elevation: 10,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
