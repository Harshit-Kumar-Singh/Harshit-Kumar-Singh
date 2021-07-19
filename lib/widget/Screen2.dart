import 'dart:ui';
import 'package:First_App/models/access_list.dart';
import 'package:First_App/widget/new_subs.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  List currencies;
  List _image;
  int index;
  Details(List currencies, int index, List _image) {
    this.currencies = currencies;
    this.index = index;
    this._image = _image;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        
        child: Container(
          //color: Colors.orangeAccent[400],
          padding: EdgeInsets.only(top: 100),
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                  height: 240,
                  //width: 200,
                  padding: EdgeInsets.all(10),
                  child: Card(
                   // shadowColor: Colors.brown,
                     clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Colors.black)),
                   // borderOnForeground: true,
                    elevation: 10,
                    color: Colors.lightGreen[50],
                    child:  Container(
                      //alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Align(child: Image(image: AssetImage(_image[index]),height: 60,),alignment:Alignment.topLeft,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  currencies[index]['symbol'],
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  currencies[index]['name'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  currencies[index]['rank'],
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                  ),
                ),
              ),

              Container(
                height: 350,
                padding: EdgeInsets.all(10),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(color: Colors.black)),
                  elevation: 10,
                  color: Colors.lightGreen[50],
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Price',
                                  style: TextStyle(
                                      color: Colors.lightGreenAccent[700],
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Supply',
                                 style: TextStyle(
                                      color: Colors.lightGreenAccent[700],
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                          
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Max Supply',
                                  style: TextStyle(
                                      color: Colors.lightGreenAccent[700],
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Volume Price(24HR)',
                                 style: TextStyle(
                                      color: Colors.lightGreenAccent[700],
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Market Capital',
                                  style: TextStyle(
                                       color: Colors.lightGreenAccent[700],
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Change Percentage',
                                   style: TextStyle(
                                      color: Colors.lightGreenAccent[700],
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                           
                          ],
                        ),
                        SizedBox(
                          width: 0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "\$${currencies[index]['priceUsd'].substring(0, 10)}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "\$${currencies[index]['supply'].substring(0, 10)}",
                                  style: TextStyle(
                                     color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "\$${currencies[index]['maxSupply'].substring(0, 10)}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "\$${currencies[index]['volumeUsd24Hr'].substring(0, 10)}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "\$${currencies[index]['marketCapUsd'].substring(0, 10)}",
                                  style: TextStyle(
                                     color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "\$${currencies[index]['changePercent24Hr'].substring(0, 10)}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )
                              ],
                            ),
                            
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              NewSubscribed(
                currencies: currencies,
                index: index,
              ),
              //new_Subs.dart
              //SubscribedList
            ],
          ),
        ),
      ),
    );
  }
}
