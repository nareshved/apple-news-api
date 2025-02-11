

class NewsModel {
  String? status;
  num? totalResults;
  List<ArticleModel>? articles;

  NewsModel(
      {required this.articles,
      required this.status,
      required this.totalResults});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    List<ArticleModel> allArticles = [];

    for (Map<String, dynamic> eachMap in json["articles"]) {
      var eachMapArticle = ArticleModel.fromJson(eachMap);
      allArticles.add(eachMapArticle);
    }

    return NewsModel(
      status: json["status"],
      totalResults: json["totalResults"],
      articles: allArticles,
    );
  }
}

class ArticleModel {
  String? author, content, description, publishedAt, title, url, urlToImage;

  SourceModel? source;

  ArticleModel(
      {required this.author,
      required this.content,
      required this.description,
      required this.publishedAt,
      required this.source,
      required this.title,
      required this.url,
      required this.urlToImage});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {

    return ArticleModel(
        author: json["author"],
        content: json["content"],
        description: json["description"],
        publishedAt: json["publishedAt"],
        source: SourceModel.fromJson(json["source"]),
        title: json["title"],
        url: json["url"],
        urlToImage: json["urlToImage"]);
  }
}

class SourceModel {
  String? id, name;

  SourceModel({required this.id, required this.name});

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(id: json["id"], name: json["name"]);
  }
}
