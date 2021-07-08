import 'package:First_App/widget/access_list.dart';
import 'package:First_App/widget/new_subs.dart';
import 'package:flutter/material.dart';
import '../models/Subscribed.dart';
import './subscribed_list.dart';
import './access_list.dart';

class UserSubscribed extends StatefulWidget {
  List currencies;
  int index;
  String img;
  UserSubscribed(this.currencies, this.index);
  @override
  _UserSubscribedState createState() => _UserSubscribedState();
}

class _UserSubscribedState extends State<UserSubscribed> {
  final List<Subscribed> _userSubscribed = [];
  void _addNewSubscribed(final newSubs) {
    final_list.add(newSubs);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewSubscribed(
            widget.currencies, widget.index, _addNewSubscribed, final_list),

        // SubscribedList(_userSubs),
      ],
    );
  }
}
