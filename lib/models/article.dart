import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart'; 

@JsonSerializable()
class Article {
  final String source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String imageUrl;
  final String datePublished;
  final String content;

  Article(this.source, this.author, this.title, this.description, this.url,
      this.imageUrl, this.datePublished, this.content);

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
