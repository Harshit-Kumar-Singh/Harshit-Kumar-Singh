import 'dart:ui';
import 'package:First_App/Scree1.dart';

import './main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './Dashboard.dart';
import './SignUpPage.dart';

class Details extends StatelessWidget {
  @override
  final String title;
  final String image;
  final String price;
  Details(this.title, this.image, this.price);
 Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Text(
              title,
            )
          ],
        ),
      ),
    );
  }
}


