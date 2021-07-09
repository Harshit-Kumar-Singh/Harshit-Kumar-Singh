import 'package:First_App/models/Subscribed.dart';
import 'package:flutter/material.dart';
import './access_list.dart';
import '../models/Subscribed.dart';
import './user_subscribed.dart';
import './new_subs.dart';

class SubscribedList extends StatelessWidget {
  List<List> final_l;
  SubscribedList(List<List> final_list) {
    final_l = final_list;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Subscribed List'),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: final_l == null ? 0 : final_l.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Card(
                    child: Row(
                      children: [
                        Text(final_l[index][0]),
                        Text(final_l[index][1]),
                      ],
                    ),
                  )
                ],
              );
            }
      )
    );
  }
}
