import 'package:First_App/widget/final_subscribed_list.dart';
import 'package:get_storage/get_storage.dart';
import './Scree1.dart';
import 'package:First_App/models/Subscribed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/access_list.dart';
import '../models/Subscribed.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;
  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("start");
      }
    });
  }

  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
  }

  signOut() async {
    _auth.signOut();

    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  final box = GetStorage();
  final countBox = GetStorage();
  List<Subscribed> final_list = [];
  void restoreSubscribeds() {
    final_list.clear();
    storageList = box.read('Subscribeds');
    print(storageList);
    String nameKey, symbolKey;

    print("StorageListLenght -- ${storageList.length}");
    print("count -- ${countBox.read('count')}");
    for (int i = 0; i < storageList.length; i++) {
      final map = storageList[i];
      // index for retreival keys accounting for index starting at 0
      final index = i + 1;

      nameKey = 'name$i';
      symbolKey = 'symbol$i';

      // recreating Subscribed objects from storage

      final Subs = Subscribed(name: map[nameKey], symbol: map[symbolKey]);

      final_list
          .add(Subs); // adding Subscribeds back to your normal Subscribed list
      print(Subs.symbol);
    }
    print("-----In restore Function----");
    for (int i = 0; i < final_list.length; i++) {
      debugPrint(
          'Subscribed ${i + 1} name ${final_list[i].name} symbol: ${final_list[i].symbol}');
    }
  }

  void copydata() {
    access_list = final_list;
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
    // restore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: !isloggedin
              ? CircularProgressIndicator()
              : Column(
                  children: <Widget>[
                    SizedBox(height: 40.0),
                    Container(
                      height: 400,
                      child: Image(
                        image: AssetImage("assets/Image/Welcome.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      child: Text(
                        "Hello ${user.displayName} you are Logged in as ${user.email}",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    RaisedButton(
                      padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashBoardFinal()));
                      },
                      child: Text('Lets Get Started',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                      color: Colors.lightGreenAccent[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Not ${user.displayName}?"),
                    RaisedButton(
                      padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                      onPressed: signOut,
                      child: Text(
                        'Signout',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      color: Colors.lightGreenAccent[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    RaisedButton(
                      padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                      onPressed: () {
                        restoreSubscribeds();
                        copydata();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SubscribedList(access_list)));
                      },
                      child: Text(
                        'Subscribed List',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      color: Colors.lightGreenAccent[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ],
                ),
        ));
  }
}
