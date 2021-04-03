import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  final String source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Article(
      {@required this.source,
      @required this.author,
      @required this.title,
      @required this.description,
      @required this.url,
      @required this.urlToImage,
      @required this.publishedAt,
      @required this.content});

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);

  static List<Article> getArticles() {
    List<Article> articles = [
      Article.fromJson(
        {
          "source": 'Tech Crunch',
          "author": "n-tv NACHRICHTEN",
          "title":
              "Wochenvorschau: Termine bis 9. April 2021 - n-tv NACHRICHTEN",
          "description":
              "Die wichtigsten Ereignisse der Woche aus Wirtschaft, Börse und Konjunktur.",
          "url":
              "https://www.n-tv.de/wirtschaft/termine/Termine-bis-9-April-2021-article22465085.html",
          "urlToImage": null,
          "publishedAt": "2021-04-02T15:00:10Z",
          "content":
              "Die wichtigsten Ereignisse der Woche aus Wirtschaft, Börse und Konjunktur.\r\nDIENSTAG, DEN 06. APRIL 2021\r\nTERMINE UNTERNEHMEN\r\n17:00 USA: Applied Materials, Investor Meeting\r\nTERMINE KONJUNKTUR\r\n03:4… [+4621 chars]"
        },
      ),
      Article.fromJson(
        {
          "source": 'Tech Crunch',
          "author": "Olalekan",
          "title":
              "Netflix sorgt für Wirbel: Diese drastische Änderung betrifft jeden - inside digital",
          "description":
              "Lange hat sich diese Änderung angekündigt, nun greift sie auch in Deutschland durch. Netflix ändert seine Konditionen. Die Details haben wir.",
          "url":
              "https://www.inside-digital.de/news/netflix-preiserhoehung-fuer-bestandskunden",
          "urlToImage":
              "https://www.inside-digital.de/img/netflix-auf-dem-smartphone-7865.jpg",
          "publishedAt": "2021-04-02T14:59:58Z",
          "content":
              "Schon im vergangenen Jahr kündigte sich die Veränderung an, denn im europäischen Ausland änderte Netflix dort bereits die Konditionen zum Beispiel in Österreich. Im Januar kam die Änderung dann auch … [+2108 chars]"
        },
      ),
      Article.fromJson(
        {
          "source": 'BBC Crunch',
          "author": "Mark Disney",
          "title":
              "Netflix sorgt für Wirbel: Diese drastische Änderung betrifft jeden - inside digital",
          "description":
              "Lange hat sich diese Änderung angekündigt, nun greift sie auch in Deutschland durch. Netflix ändert seine Konditionen. Die Details haben wir.",
          "url":
              "https://www.inside-digital.de/news/netflix-preiserhoehung-fuer-bestandskunden",
          "urlToImage":
              "https://www.inside-digital.de/img/netflix-auf-dem-smartphone-7865.jpg",
          "publishedAt": "2021-04-02T14:59:58Z",
          "content":
              "Schon im vergangenen Jahr kündigte sich die Veränderung an, denn im europäischen Ausland änderte Netflix dort bereits die Konditionen zum Beispiel in Österreich. Im Januar kam die Änderung dann auch … [+2108 chars]"
        },
      ),
      Article.fromJson(
        {
          "source": 'Tech Crunch',
          "author": "Market Study Report",
          "title":
              "Retail E-Commerce Software Market: Business Opportunities, Current Trends and In - Business-newsupdate.com",
          "description":
              "The latest Retail E-Commerce Software market report lends a competitive head start to businesses by offering accurate predictions for this vertical at both regi",
          "url":
              "https://www.business-newsupdate.com/retail-e-commerce-software-market-67989",
          "urlToImage": "https://www.business-newsupdate.com/img/img-10.png",
          "publishedAt": "2021-04-03T05:45:18Z",
          "content":
              "The latest Retail E-Commerce Software market report lends a competitive head start to businesses by offering accurate predictions for this vertical at both regional and global scale. It entails a top… [+6078 chars]"
        },
      ),
      Article.fromJson(
        {
          "source": "Adify Media News",
          'author': null,
          'title':
              "Temperature and Humidity Logger Market Top countries data 2021 Industry Growth Analysis, Segmentation, Size, Share, Trend, Future Demand and Leading Players Updates by Forecast By 360 Market Updates - Adify Media News",
          'description': null,
          'url':
              "https://adifymedia.com/temperature-and-humidity-logger-market-top-countries-data-2021-industry-growth-analysis-segmentation-size-share-trend-future-demand-and-leading-players-updates-by-forecast-by-360-market-updates/367551/",
          'urlToImage': null,
          'publishedAt': "2021-04-02T15:37:13Z",
          'content':
              "This market study covers the global and regional market with an in-depth analysis of the overall growth prospects in the market. Furthermore, it sheds light on the comprehensive competitive landscape… [+15285 chars]"
        },
      ),
    ];

    return articles;
  }
}
