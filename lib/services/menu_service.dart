

import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:mad2/model/menu.dart';

import 'package:flutter/services.dart' show rootBundle;

class MenuService {

  FirebaseDatabase _db = FirebaseDatabase.instance;
  String _dbRefKey = "menu";

  Future<List<String>> getMenus() async{
    DatabaseReference _dbRef = _db.ref();
    final snapshot = await _dbRef.child(_dbRefKey).get();
    List<String> menuList = [];
    if(snapshot.exists){
      final data = snapshot.value as Map;
      final myMap = data.values;
      myMap.forEach((e){
        print(e["name"]);
      });
      // final jsonData = jsonDecode(data.values as String);
      // print(jsonData);

      // for(Map<dynamic, dynamic> entry in data.values){
      //   print(entry.values);
      // }
      // final dataRes = jsonDecode(data) as List<Map<String,dynamic>>;
      // print("Data : ${dataRes[1]}");
    }
    return [];
  }

  Future<void> saveMenu(Map<String,dynamic> bodyReq) async{
    DatabaseReference _dbRef = _db.ref();
    // Generate
    final _childKey = await _dbRef.push().key;
    DatabaseReference _dbRefParent = await _dbRef.child(_dbRefKey);
    await _dbRefParent.child(_childKey!).set(bodyReq);
  }

  Future<List<Menu>> loadMenu() async{
      try {
        final menuJson = await rootBundle.loadString("assets/menu/menu.json");
        Map<String,dynamic> menuMap = jsonDecode(menuJson);
        List<Menu> menuList = menuMap.values.map((val) => Menu.fromJson(val)).toList();
        return menuList;
      }catch(err){
        throw("Error load data");
      }
  }


}
