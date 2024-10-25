import 'package:flutter/material.dart';
import 'package:mad2/model/news.dart';
import 'package:mad2/routes.dart';
import 'package:mad2/services/news_service.dart';

class NewsScreen extends StatefulWidget {

  const NewsScreen ({super.key});

  @override
  State<NewsScreen> createState() => _State();
}

class _State extends State<NewsScreen> {

  final newsService = NewsService();
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
        elevation: 5,
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: (){
              RouteGenerator.key.currentState!.pushNamed(RouteGenerator.addNewsScreen);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      body: FutureBuilder(
          future: newsService.loadNews(), 
          builder: (BuildContext context, AsyncSnapshot<List<News>> asyncSnapshot){
            if(asyncSnapshot.connectionState == ConnectionState.done){
              if(asyncSnapshot.hasError){
                return Center(
                  child: Text("${asyncSnapshot.error}"),
                );
              }
               if(!asyncSnapshot.hasData){
                 return  Center(
                   child: Text("No Data"),
                 );
               }
               List<News> newsList = asyncSnapshot.data as List<News>;
              
               return ListView.builder(
                   itemCount: newsList.length,
                   itemBuilder: (BuildContext context, int index){
                     final newsItem = newsList[index];
                     return Card(
                       elevation: 5,
                       child: ListTile(
                         title: Text("${newsItem.title}"),
                         leading: Image.network("${newsItem.urlToImage}"),
                       ),
                     );
                   });
            }else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
