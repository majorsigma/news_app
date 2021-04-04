import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/article.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
              Text(
                'Breaking News',
                style:
                    GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              // SizedBox(height: 20),
              // PageView.builder(
              //   itemCount: Article.getArticles().length,
              //   itemBuilder: (context, index) {
              //     return Container(
              //       width: 200,
              //       height: 400,
              //       color: Colors.lightBlue,
              //     );
              //   },
              // ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          CircleAvatar(
            // backgroundImage: Image.asset("name"),
            child: Icon(Icons.verified_user_outlined),
          ),
        ],
      ),
      // ),
      elevation: 0,
    );
  }
}
