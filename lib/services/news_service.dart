
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:mad2/model/news.dart';

class NewsService {

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collectionPath = "news";

  Future<List<News>> loadNews() async{

    // Load Data from Firestore
    try{
      CollectionReference _colRef = _firestore.collection(collectionPath);
      final querySnapshot = await _colRef.get();
      List<News> newsList = [];
      for( var doc in querySnapshot.docs){
        final data = doc.data() as Map<String,dynamic>;
        print("ID : ${doc.id}");
        print("Data : $data");
        final news = News(
            title: data["title"],
            urlToImage: data["urlToImage"]
        );
        newsList.add(news);
      }
      return newsList;
    }catch(err){
      throw("Error ${err}");
    }

    // load Data from API
    // final res = await http.get(Uri.parse("https://newsapi.org/v2/everything?q=tesla&from=2024-09-21&sortBy=publishedAt&apiKey=39e26862b23948d8a235e9926a04f79c"));
    // if(res.statusCode == 200){
    //     final data = jsonDecode(res.body) as Map;
    //     if(data["status"] == "ok"){
    //       final articles = data["articles"] as List<dynamic>;
    //       List<News> newsList = [];
    //       articles.forEach((e){
    //         print(e["author"]);
    //         final news = News(
    //             title: e["title"],
    //             urlToImage: e["urlToImage"]
    //         );
    //         newsList.add(news);
    //       });
    //       return newsList;
    //     }else{
    //       return [];
    //     }
    // }else{
    //   throw("Error internet connection");
    // }

  }

  void saveNews(){

  }

  void updateNews(){

  }

  void deleteNews(){

  }
}