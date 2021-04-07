import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';

class DummyData {
  static List<String> tabTitles = [
    "Technology",
    "Business",
    "Health",
    "Science",
    "Entertainment",
    "Sport",
  ];

  static List<Tab> createListOfTabs() {
    List<Tab> tabList = [];
    tabTitles.forEach((element) {
      Tab tabElement = Tab(
        child: Text(
          element,
          style: TextStyle(fontSize: 20),
        ),
      );
      tabList.add(tabElement);
    });

    return tabList;
  }

  static List<Widget> createListOfTabViewWidgets() {
    List<Widget> tabViewWidgets = [];
    tabTitles.forEach((element) {
      List<Article> articleList = Article.getArticles();
      ListView listView = ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: articleList.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            articleList[index].title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            articleList[index].content,
            maxLines: 2,
          ),
        ),
      );

      tabViewWidgets.add(listView);
    });
    return tabViewWidgets;
  }
}
