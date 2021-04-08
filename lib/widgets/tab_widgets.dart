import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/dummy_images.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/services/api_service.dart';
import 'package:news_app/services/service_locator.dart';
import 'package:news_app/utils/constants.dart';

List<Tab> createListOfTabs() {
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

List<Widget> getTabViewWidgets() {
  ApiService apiService = getIt.get<ApiService>();
  List<Widget> widgetList = [];
  tabTitles.forEach((element) {
    String name = element.toLowerCase();
    String newUrl = apiService.getTopHeadLinesURL + "&category=$name";

    Future<News> news = apiService.fetchNews(
        client: apiService.httpClient,
        url: newUrl,
        headers: {"X-Api-Key": apiService.getAPIKey});

    FutureBuilder futureBuilder = FutureBuilder<News>(
      future: news,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: snapshot.data.articles.length,
            itemBuilder: (context, index) => ListTile(
              leading: AspectRatio(
                aspectRatio: 1.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: snapshot.data.articles[index].urlToImage == null
                      ? Image.asset('assets/images/placeholder.png', fit: BoxFit.cover)
                      : CachedNetworkImage(
                          imageUrl: snapshot.data.articles[index].urlToImage,
                          errorWidget: (context, _, __) =>
                              Image.asset('assets/images/ship.jpg', fit: BoxFit.cover,),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              title: Text(
                snapshot.data.articles[index].title == null
                    ? ""
                    : snapshot.data.articles[index].title,
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                snapshot.data.articles[index].content == null
                    ? ""
                    : snapshot.data.articles[index].title,
                maxLines: 2,
              ),
            ),
          );
        }
      },
    );
    widgetList.add(futureBuilder);
  });
  return widgetList;
}
