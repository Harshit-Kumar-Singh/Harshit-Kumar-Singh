import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/Subscribed.dart';
import '../models/access_list.dart';
import 'package:get_storage/get_storage.dart';

class NewSubscribed extends StatefulWidget {
  final List currencies;
  final int index;
  const NewSubscribed(
      {Key key, @required this.currencies, @required this.index})
      : super(key: key);

  @override
  _NewSubscribedState createState() => _NewSubscribedState();
}

class _NewSubscribedState extends State<NewSubscribed> {
  final box = GetStorage();
  final countBox = GetStorage();
  List<Subscribed> final_list = [];
  void addAndStoreSubscribed(Subscribed Subs) {
    final storageMap = {};
    count = countBox.read(Keyword+'count');
    final nameKey = 'name$count';
    final symbolKey = 'symbol$count';
    storageMap[nameKey] = Subs.name;
    storageMap[symbolKey] = Subs.symbol;

    storageList.add(storageMap); // adding temp map to storageList
    box.write(Keyword, storageList);
    count++;
    countBox.write(Keyword+'count', count);
    // adding list of maps to storage
    //clearSubscribeds();
  }

  void clearSubscribeds() {
    final_list.clear();
    storageList.clear();
    box.erase();
    countBox.erase();
  }

  // @override
  // void initState() {
  //   super.initState();

  //   // restore list from storing in initState
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
          padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
          onPressed: () {
            bool check = true;
            String name_c = widget.currencies[widget.index]['name'];
            String symbol_c = widget.currencies[widget.index]['symbol'];
            storageList = box.read(Keyword);
            if (storageList == null) {
            } else {
              if (storageList.length == null) {
              } else {
                for (int i = 0; i < storageList.length; i++) {
                  print(storageList[i]['symbol$i']);
                  if (storageList[i]['symbol$i'] == symbol_c) {
                    check = false;
                    break;
                  }
                }
              }
            }
            if (check == false) {
              showMessage(context);
            } else {
              final Subs = Subscribed(name: name_c, symbol: symbol_c);
              countBox.writeIfNull(Keyword+'count', 0);
              box.writeIfNull(Keyword, []);
              addAndStoreSubscribed(Subs);
              showMessage2(context);
            }
            //clearSubscribeds();

            //printSubscribeds();
          },
          child: Text(
            'Subscribe',
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
    );
  }
}

void showMessage(BuildContext context) {
  var dailog = AlertDialog(
    content: Text("Currency already present"),
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return dailog;
      });
}

void showMessage2(BuildContext context) {
  var dailog = AlertDialog(
    content: Text("Currency added to subscribed List successfully"),
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return dailog;
      });
}
// class NewSubscribed extends StatelessWidget {
//   List currencies;
//   int index;

//   NewSubscribed(
//     this.currencies,
//     this.index,
//   );
//   final box = GetStorage();
//   List storage = [];

//   void _addNewSubscribed(Subscribed newSubs) {
//     final storagemap = {};
//     final index = final_list.length;
//     final symbolkey = '$count';
//     final namekey = '$count';
//     storagemap[namekey] = newSubs.name;
//     storagemap[symbolkey] = newSubs.symbol;
//     storage.add(storagemap);

//     box.write('list', storage);
//     count++;
//     print(storage);
//   }

//   void restore() {
//     final_list.clear();
//     List storage = [];
//     storage = box.read('list');
//     String namekey;
//     String symbolkey;

//     print(final_list.length);
//     print("Loop-->");
//     for (int i = 0; i < storage.length; i++) {
//       final map = storage[i];
//       final index = i;
//       namekey = '$index';
//       symbolkey = '$index';

//       final Subscribed = Subscribed(symbol: map[symbolkey], name: map[namekey]);

//       print(namekey);
//       print(Subscribed.name);
//       final_list.add(Subscribed);
//     }
//     print(final_list);
//     print("Loop-->end");
//   }
//    @override
//   void initState() {
//     super.initState();
//     restore(); // restore list from storing in initState
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               RaisedButton(
//                 padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//                 onPressed: () {
//                   final check = Subscribed(
//                     symbol: currencies[index]['symbol'],
//                     name: currencies[index]['name'],
//                   );
//                   _addNewSubscribed(
//                     check,
//                   );
//                   print(final_list);
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => SubscribedList(final_list)));
//                 },
//                 child: Text('Subscribe',
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20.0,
//                         fontWeight: FontWeight.bold)),
//                 color: Colors.lightGreenAccent[400],
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//               ),
//               RaisedButton(
//                 padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
//                 onPressed: () {},
//                 child: Text('Unsubscribe',
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20.0,
//                         fontWeight: FontWeight.bold)),
//                 color: Colors.lightGreenAccent[400],
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//               ),
//             ]),
//       ],
//     );
//   }
// }
