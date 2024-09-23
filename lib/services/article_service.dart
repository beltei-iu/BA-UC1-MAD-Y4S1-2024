import 'dart:convert';
import 'package:http/http.dart' as http;

class ArticleService {

  Future<List<Map<String,dynamic>>> getArticles() async{
    String apiUrl = "https://api.example.com/article";
    final response = await http.get(Uri.parse(apiUrl));
    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }else{
      throw("Internal Server Error");
    }
  }

  Future<Map<String,dynamic>> saveArticles(Map<String, dynamic> data) async{
    String apiUrl = "https://api.example.com/article";
    final response = await http.post(Uri.parse(apiUrl), body: data);
    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }else{
      throw("Internal Server Error");
    }
  }

  Future<Map<String,dynamic>> updateArticles(int id, Map<String, dynamic> data) async{
    String apiUrl = "https://api.example.com/article/$id";
    final response = await http.put(Uri.parse(apiUrl), body: data);
    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }else{
      throw("Internal Server Error");
    }
  }

  Future<Map<String,dynamic>> deleteArticles(int id) async{
    String apiUrl = "https://api.example.com/article/$id";
    final response = await http.delete(Uri.parse(apiUrl));
    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }else{
      throw("Internal Server Error");
    }
  }

}