import 'package:flutter/material.dart';
import '../models/Subscribed.dart';
import 'package:get_storage/get_storage.dart';
import '../models/access_list.dart';

class SubscribedList extends StatefulWidget {
  List<Subscribed> subs;
  SubscribedList(this.subs);

  @override
  _State createState() => _State();
}

class _State extends State<SubscribedList> {
  final box = GetStorage();
  final countBox = GetStorage();
  List<Subscribed> final_list = [];
  void deleteCurrency(int idx) {
    String nameKey, symbolKey;
    final_list.clear();
    storageList = box.read(Keyword);
    for (int i = idx; i < storageList.length - 1; i++) {
      int index = i + 1;
      nameKey = 'name$index';
      symbolKey = 'symbol$index';
      final map1 = storageList[i];
      final map = storageList[i + 1];
      map1['name$i'] = map[nameKey];
      map1['symbol$i'] = map[symbolKey];
      storageList[i] = map1;
    }
    storageList.removeAt(storageList.length - 1);
    box.write(Keyword, storageList);

    count = countBox.read(Keyword + 'count');
    count--;
    countBox.write(Keyword + 'count', count);
    print("StorageListLenght -- ${storageList.length}");
    print("count -- ${countBox.read(Keyword + 'count')}");
    storageList = box.read(Keyword);
    for (int i = 0; i < storageList.length; i++) {
      final map = storageList[i];
      nameKey = 'name$i';
      symbolKey = 'symbol$i';
      final Subs = Subscribed(name: map[nameKey], symbol: map[symbolKey]);
      final_list.add(Subs);
    }
    print("-----In restore Function----");
    for (int i = 0; i < final_list.length; i++) {
      debugPrint(
          'Subscribed ${i + 1} name ${final_list[i].name} symbol: ${final_list[i].symbol}');
    }
    widget.subs = final_list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Subscribed List",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.lightGreenAccent[400],
      ),
      body: ListView.builder(
          itemCount: widget.subs == null ? 0 : widget.subs.length,
          itemBuilder: (BuildContext, int index) {
            return Container(
             
              child: Column(
                children: [
                  
                  Container(
                     padding: EdgeInsets.all(4),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: Colors.black)),
                      borderOnForeground: true,
                      elevation: 10,
                      color: Colors.white,
                      
                      child: Container(
                        padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                        child: Row(
                          
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(widget.subs[index].symbol,style: TextStyle(fontSize: 20,color:Colors.blue),),
                            Text(widget.subs[index].name,style: TextStyle(fontSize: 20,color:Colors.blue),),
                            IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    deleteCurrency(index);
                                    print("in delete icon");
                                  }
                                );
                              }
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
