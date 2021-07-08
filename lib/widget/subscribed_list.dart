import 'package:First_App/models/Subscribed.dart';
import 'package:flutter/material.dart';

import '../models/Subscribed.dart';
import './user_subscribed.dart';
import './new_subs.dart';


class SubscribedList extends StatelessWidget {
  final List<Subscribed> final_l;
  SubscribedList(this.final_l);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscribed List'),
        centerTitle: true,
      ),
      body:ListView.builder(
          itemCount: final_l == null ? 0 : final_l.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Card(
                  child: Row(children: [
                    Text(final_l[index].logo),
                    Text(final_l[index].name),
                  ],),
                )
              ],
            );
          }
      )
    );
  }

  
}
