import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/models/article.dart';

void main() {
  test("Create an Article instrance from article list", () {
    Article article = Article.getArticles()[0];
    expect(article.content, isA<String>());
  });
  test("get a list of articles and see how long it is.", () {
    List<Article> articles = Article.getArticles();
    expect(articles.length, 5);
  });
}
