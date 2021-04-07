import 'package:flutter/material.dart';
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
        Text(
          'Breaking News',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 20),
        buildSlidingNewsWidget(),
        TabBar(
          tabs: _tabs,
          controller: _tabController,
          isScrollable: true,
        ),
        Container(
           height: 1000,
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
        // width: 100,
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
              child: Stack(children: [
                Container(
                  width: 350,
                  height: 400,
                  child: Image.asset(
                    DummyImages.imageList[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ]),
            );
          },
        ),
      ),
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
