import 'dart:convert';

NewsApi newsApiFromJson(String str) => NewsApi.fromJson(json.decode(str));

String newsApiToJson(NewsApi data) => json.encode(data.toJson());

class NewsApi {
  List<Article> articles;
  NewsApi({required this.articles});

  factory NewsApi.fromJson(Map<String, dynamic> json) => NewsApi(
      articles:
          List<Article>.from(json['articles'].map((x) => Article.fromJson(x))));

  Map<String, dynamic> toJson() =>
      {'articles': List<dynamic>.from(articles.map((x) => x.toJson()))};
}

class Article {
  String? author, urlToImage, title, description, url, content;
  DateTime? publishedAt;

  Article({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        author: json['author'],
        content: json['content'],
        description: json['description'],
        publishedAt: DateTime.parse(json['publishedAt']),
        title: json['title'],
        url: json['url'],
        urlToImage: json['urlToImage'],
      );

  Map<String, dynamic> toJson() => {
        'author': author,
        'content': content,
        'description': description,
        'publishedAt': publishedAt!.toIso8601String(),
        'title': title,
        'url': url,
        'urlToImage': urlToImage,
      };
}



