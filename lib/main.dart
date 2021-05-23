import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './SecondPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto App',
      home: MyHomePage(),
      color: Colors.red,
    );
  }
}
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Crypto App'),
        foregroundColor: Colors.deepOrange,
      ),
      body:
        Container(
          color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Container(
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Image/1.png"),
                  fit: BoxFit.fill,
                ),
                color: Colors.white,
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    print('Green Color');
                    return Colors.orange;
                  },
                ),
              ),
              child: Text("Let's Get Started"),
              onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>Login() )),
              },
            ),
          ],  
        ),
      ),
    );
  }
}
/*
 Container(
                  height: 80,
                  width: double.infinity,
                  child: Card(
                    child: InkWell(
                      onTap: () async {
                        Navigator.push(
                          context, MaterialPageRoute(builder: (context) => Details()));
                        },
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
                                    image: AssetImage(
                                      "assets/Image/bitcoinIcon.png",
                                    ),
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
                ), 
                Expanded(
                        child: ListView.builder(
                            itemCount: currencies.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.all(18),
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 10,
                                      )
                                    ],
                                    color: Colors.white
                                  ),
                                  child: GestureDetector(
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        child: Image.asset(currencies[index].image),
                                      ),
                                      title: Text(
                                        currencies[index].title,
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        '${currencies[index].qty}'
                                      ),
                                      trailing: Text(
                                        '${currencies[index]}'
                                      ),
                                    
                                    ),
                                  ),
                                ),
                              );
                            }
                          ),
                      )
                */