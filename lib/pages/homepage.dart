import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/models/dummy_images.dart';
import 'package:news_app/utils/dummy_data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<Tab> _tabs;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabs = DummyData.createListOfTabs();
    _tabController = TabController(
      length: DummyData.tabTitles.length,
      vsync: this,
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
        ),
        Container(
          constraints:
              BoxConstraints.expand(height: MediaQuery.of(context).size.height),
          child: TabBarView(
            controller: _tabController,
            children: DummyData.createListOfTabViewWidgets(),
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
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: Article.getArticles().length,
          separatorBuilder: (context, index) => SizedBox(
            width: 16,
          ),
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Container(
                    child: AspectRatio(
                      aspectRatio: 0.75,
                      child: Image.asset(
                        DummyImages.imageList[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  buildPositionedOverlayWidget(index),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Positioned buildPositionedOverlayWidget(int index) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      // top: 200,
      // child: Container(
      //   child: BackdropFilter(
      //     filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
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
                Article.getArticles()[index].title,
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
                Article.getArticles()[index].content,
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
                Article.getArticles()[index].publishedAt,
                maxLines: 3,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14, // fontWeight: FontWeight.bold,
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
            onPressed: () {
              print('Date/Time now: ${DateTime.now()}');
            },
          ),
          CircleAvatar(
            // backgroundImage: Image.asset("name"),
            child: Icon(Icons.person),
          ),
        ],
      ),
      // ),
      elevation: 0,
    );
  }
}
