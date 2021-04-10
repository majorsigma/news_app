import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/pages/news_detail_page.dart';
import 'package:news_app/services/api_service.dart';
import 'package:news_app/services/service_locator.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/widgets/tab_widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<Tab> _tabs;
  TabController _tabController;
  ApiService _apiService;
  Future<News> _news;

  @override
  void initState() {
    super.initState();
    _tabs = createListOfTabs();
    _tabController = TabController(
      length: tabTitles.length,
      vsync: this,
    );
    _apiService = getIt.get<ApiService>();
    _news = _apiService.fetchNews(
      client: _apiService.httpClient,
      url: _apiService.getTopHeadLinesURL,
      headers: {'X-Api-Key': _apiService.getAPIKey},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildPageListView(),
    );
  }

  Widget buildPageListView() {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            'Breaking News',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(height: 20),
        buildSlidingNewsWidget(),
        SizedBox(height: 20),
        TabBar(
          tabs: _tabs,
          controller: _tabController,
          isScrollable: true,
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.blue,
        ),
        Container(
          constraints:
              BoxConstraints.expand(height: MediaQuery.of(context).size.height),
          child: TabBarView(
            controller: _tabController,
            children: getTabViewWidgets(),
          ),
        ),
      ],
    );
  }

  Widget buildSlidingNewsWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Container(
        height: 400,
        child: FutureBuilder<News>(
          future: _news,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.articles.getRange(5, 10).length,
                separatorBuilder: (context, index) => SizedBox(
                  width: 16,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        children: [
                          Container(
                            child: AspectRatio(
                              aspectRatio: 0.75,
                              child: snapshot.data.articles[index].urlToImage ==
                                      null
                                  ? Image.asset('assets/images/ship.jpg',
                                      fit: BoxFit.cover)
                                  : CachedNetworkImage(
                                      imageUrl: snapshot
                                          .data.articles[index].urlToImage,
                                      placeholder: (context, message) => Center(
                                          child: CircularProgressIndicator()),
                                      errorWidget: (context, _, __) =>
                                          Image.asset('assets/images/ship.jpg',
                                              fit: BoxFit.cover),
                                      fit: BoxFit.cover,
                                    ),
                                  // : Image.asset('assets/images/ship.jpg',
                                  //     fit: BoxFit.cover),
                            ),
                          ),
                          buildPositionedOverlayWidget(snapshot, index),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return NewsDetailPage(
                            url: snapshot.data.articles[index].url,
                            title: snapshot.data.articles[index].title,
                          );
                        }),
                      );
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  Positioned buildPositionedOverlayWidget(AsyncSnapshot<News> news, int index) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.black54.withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                news.data.articles[index].title,
                maxLines: 3,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                news.data.articles[index].content == null
                    ? ""
                    : news.data.articles[index].content,
                maxLines: 3,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16, // fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                DateFormat.yMMMMd()
                    .add_jm()
                    .format(news.data.articles[index].publishedAt),
                maxLines: 3,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      //   ),
      // ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.menu,
              size: 32,
            ),
            onPressed: () {},
          ),
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/user.jpg'),
          ),
        ],
      ),
      // ),
      elevation: 0,
    );
  }
}
