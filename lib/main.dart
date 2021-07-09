import 'package:First_App/widget/access_list.dart';
import './widget/Login.dart';
import './widget/SecondPage.dart';
import './widget/SignUpPage.dart';
import './widget/SecondPage.dart';
import 'package:flutter/material.dart';
import './widget/HomePage.dart';
import 'models/Subscribed.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final data = GetStorage();

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.lightGreenAccent[400],
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      
      routes: <String, WidgetBuilder>{
        "Login": (BuildContext context) => Login(),
        "SignUp": (BuildContext context) => SignUp(),
        "start": (BuildContext context) => Start(),
      },
    );
  }
}
