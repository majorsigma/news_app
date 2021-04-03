// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return Article(
    json['source'] as String,
    json['author'] as String,
    json['title'] as String,
    json['description'] as String,
    json['url'] as String,
    json['imageUrl'] as String,
    json['datePublished'] as String,
    json['content'] as String,
  );
}

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'source': instance.source,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'imageUrl': instance.imageUrl,
      'datePublished': instance.datePublished,
      'content': instance.content,
    };
