import 'package:First_App/models/Subscribed.dart';
import 'dart:math';
import 'package:First_App/widget/final_subscribed_list.dart';
import 'package:get_storage/get_storage.dart';
import 'package:First_App/models/Subscribed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/access_list.dart';
import '../models/Subscribed.dart';


 List<Subscribed> access_list = [];
int count;
List storageList = [];
List image = [
    "assets/Image/1.png",
    "assets/Image/2.png",
    "assets/Image/3.png",
    "assets/Image/4.png",
    "assets/Image/5.png",
    "assets/Image/6.png",
    "assets/Image/7.png",
    "assets/Image/8.png",
    "assets/Image/9.png",
    "assets/Image/10.png",
    "assets/Image/11.png",
    "assets/Image/12.png",
    "assets/Image/13.png",
    "assets/Image/14.png",
    "assets/Image/15.png",
    "assets/Image/16.png",
    "assets/Image/17.png",
    "assets/Image/18.png",
    "assets/Image/19.png",
    "assets/Image/20.png",
    "assets/Image/21.png",
    "assets/Image/22.png",
    "assets/Image/23.png",
    "assets/Image/24.png",
    "assets/Image/25.png",
    "assets/Image/26.png",
    "assets/Image/27.png",
  ];
  String Keyword ;
