import 'package:First_App/widget/final_subscribed_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './final_subscribed_list.dart';
import '../models/Subscribed.dart';

class NewSubscribed extends StatelessWidget {
  List currencies;
  int index;
  List<Subscribed> final_l;
  Function addSubs;
  NewSubscribed(
    this.currencies,
    this.index,
    this.addSubs,
    this.final_l,
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                onPressed: () {
                  bool flag = false;
                  for (var item in final_l) {
                    if (item.logo == currencies[index]['symbol']) {
                      flag = true;
                      break;
                    }
                  }
                  final check = Subscribed(
                      logo: currencies[index]['symbol'],
                      name: currencies[index]['name'],
                  );
                  if (flag) {
                    print("already present");
                  } else {
                   
                    addSubs(
                      check,
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SubscribedList(final_l)));
                  }
                },
                child: Text('Subscribe',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)),
                color: Colors.lightGreenAccent[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              RaisedButton(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                onPressed: () {},
                child: Text('Unsubscribe',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)),
                color: Colors.lightGreenAccent[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ]),
      ],
    );
  }
}
