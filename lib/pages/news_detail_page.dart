import 'package:flutter/material.dart';

class NewsDetailPage extends StatelessWidget {
  String _url;
  String _title;

  NewsDetailPage({Key key, String url, String title})
      : _url = url,
        _title = title,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(_title),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Placeholder(),
          ),
        ),
      ),
    );
  }
}
