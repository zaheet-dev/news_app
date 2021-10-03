import 'dart:convert';
import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news = [];

  Future<void> getNews() async{
    String url = "https://newsapi.org/v2/top-headlines?country=in&apiKey=98698d0025bf47d3bd30b6fc0c7d4e2f";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);
    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element) {
          if(element["urlToImage"] != null && element["description"] != null){
            ArticleModel articleModel = ArticleModel(
                title: element["title"],
                description: element["description"],
                urlToImage: element["urlToImage"],
                url: element["url"],
                content: element["content"],
                author: element["author"],
            );
            news.add(articleModel);
          }
      });
    }
  }
}

class NewsForCategorie {

  List<ArticleModel> news = [];

  Future<void> getNewsForCategory(String category) async {

    /*String url = "http://newsapi.org/v2/everything?q=$category&apiKey=${apiKey}";*/
    String url = "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=98698d0025bf47d3bd30b6fc0c7d4e2f";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);
    print(jsonData);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel article = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            content: element["content"],
          );
          news.add(article);
        }
      });
    }
  }
}