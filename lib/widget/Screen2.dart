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
  String Change(String X) {
    bool check = false;
    for (int i = 0; i < X.length; i++) {
      if (X[i] == '.') {
        check = true;
        X = X.substring(0, i + 2);
        return X;
      }
    }
  }

  Widget build(BuildContext context) {
    String changePercent24Hr = currencies[index]["changePercent24Hr"];
    String priceUsd = currencies[index]["priceUsd"];
    String volumeUsd24Hr = currencies[index]["volumeUsd24Hr"];
    String supply = currencies[index]["supply"];
    changePercent24Hr = Change(changePercent24Hr);
    priceUsd = Change(priceUsd);
   
    volumeUsd24Hr = Change(volumeUsd24Hr);
    supply = Change(supply);
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
                    child: Container(
                      //alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Align(
                            child: Image(
                              image: AssetImage(_image[index%(image.length)]),
                              height: 60,
                            ),
                            alignment: Alignment.topLeft,
                          ),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("PRICE",
                                  style: TextStyle(
                                      color: Colors.lightGreen[900],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19)),
                              Text("\$ ${priceUsd}",
                                  style: TextStyle(color: Colors.grey,fontSize:18,fontWeight: FontWeight.bold))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Supply',
                                  style: TextStyle(
                                      color: Colors.lightGreen[900],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19)),
                              Text("\$ ${supply}",
                                  style: TextStyle(color: Colors.grey,fontSize:18,fontWeight: FontWeight.bold))
                            ],
                          ),
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Volume Price',
                                  style: TextStyle(
                                      color: Colors.lightGreen[900],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19)),
                              Text("\$ ${volumeUsd24Hr}",
                                  style: TextStyle(color: Colors.grey,fontSize:18,fontWeight: FontWeight.bold))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Change Percentage',
                                  style: TextStyle(
                                      color: Colors.lightGreen[900],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19)),
                              Text(
                                  "\$ ${changePercent24Hr}",
                                  style: TextStyle(color: Colors.grey,fontSize:18,fontWeight: FontWeight.bold))
                            ],
                          )
                        ],
                      )),
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

               
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Price',
//                                   style: TextStyle(
//                                       color: Colors.lightGreenAccent[700],
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                               ],
//                             ),

//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "\$${currencies[index]['priceUsd']}",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 15),
//                                 )
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Text(
//                                   "\$${currencies[index]['supply']}",
//                                   style: TextStyle(
//                                      color: Colors.black,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 18),
//                                 )
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Text(
//                                   "\$${currencies[index]['maxSupply']}",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 18),
//                                 )
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Text(
//                                   "\$${currencies[index]['volumeUsd24Hr']}",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 18),
//                                 )
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Text(
//                                   "\$${currencies[index]['marketCapUsd']}",
//                                   style: TextStyle(
//                                      color: Colors.black,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 18
//                                   ),
//                                 )
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Text(
//                                   "\$${currencies[index]['changePercent24Hr']}",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 18),
//                                 )
//                               ],
//                             ),
                            
//                           ],
//                         ),
//                       ],
//                     ),