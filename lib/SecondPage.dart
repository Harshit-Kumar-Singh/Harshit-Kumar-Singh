import 'dart:ui';
import './main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './Dashboard.dart';
import './SignUpPage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String _email, _password;
  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user != null) {
        
      } else {
        print('User not signed in!');
      }
    });
  }

  login() async {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();

      try {
        await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      
      } catch (e) {
        print(e);
        showError(e.message);
      }
    }
    Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ERROR'),
            content: Text(errormessage),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Image/Login.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Form(
                  key: _formkey,
                  child: Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(3),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(2.0),
                                decoration: BoxDecoration(color: Colors.white),
                                child: TextFormField(
                                  validator: (input) {
                                    if (input.isEmpty) return 'Enter Email';
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Email or Phone number',
                                    prefixIcon: Icon(Icons.email),
                                    hintStyle: TextStyle(
                                      color: Colors.grey[300],
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 100.0,
                                      ),
                                    ),
                                  ),
                                  onSaved: (input) => _email = input,
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                    validator: (input) {
                                      if (input.length < 6)
                                        return 'Provide Minimum 6 Character';
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.lock),
                                      border: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10.0)),
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 5.0,
                                        ),
                                      ),
                                      hintText: 'Password',

                                      hintStyle: TextStyle(
                                        color: Colors.grey[300],
                                      ),
                                    ),
                                    obscureText: true,
                                    onSaved: (input) => _password = input),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 3.0,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 30, left: 30),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                      print('Green Color');
                                      return Colors.orange;
                                    },
                                  ),
                                ),
                                onPressed: login,
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 30, left: 30),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                      print('Green Color');
                                      return Colors.orange;
                                    },
                                  ),
                                ),
                                onPressed: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUp())),
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SignInButton(
                              Buttons.Google,
                              text: "Google",
                              padding: EdgeInsets.only(left: 30, right: 10),
                              onPressed: () {},
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
/* Container(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Coin",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Buying  Price",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text("Selling Price",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.end),
                ],
              ),
              ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                   Container(
                      height: 80,
                      width: double.infinity,
                      child: Card(
                        shadowColor: Colors.green,
                        child: InkWell(
                          onTap: () async {},
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 10,
                                    ),
                                    CircleAvatar(
                                      radius: 19,
                                      backgroundColor: Colors.white,
                                      child: Image(
                                        image:
                                            AssetImage('assets/Image/BTC.png'),
                                        height: 20,
                                        width: 20,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Text(
                                      'BTC',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Text(
                                  "529\$",
                                  style: TextStyle(
                                    color: Colors.green[700],
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "529\$",
                                  style: TextStyle(
                                    color: Colors.green[700],
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        borderOnForeground: true,
                        elevation: 10,
                        color: Colors.grey[850],
                      ),
                    );
                  }),
            ],
          ),
        ));*/