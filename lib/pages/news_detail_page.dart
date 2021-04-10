import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:news_app/services/api_service.dart';
import 'package:news_app/services/service_locator.dart';

class NewsDetailPage extends StatelessWidget {
  final String _url;
  final String _title;

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
            child: FutureBuilder<String>(
              future: getIt.get<ApiService>().loadPage(_url),
              builder: (context, snapshot) {
                if (!snapshot.hasData ||
                    snapshot.connectionState == ConnectionState.waiting)
                  return Center(child: CircularProgressIndicator());
                else
                  return Html(
                    data: snapshot.data,
                    shrinkWrap: true,
                    blacklistedElements: ["li", 'ul', 'meta', 'link'],  
                  );
              },
            ),
          ),
        ),
      ),
    );
  }
}
