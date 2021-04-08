import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/services/api_service.dart';
import 'package:news_app/services/service_locator.dart';

void main() {
  ApiService apiService;
  setupGetIt();
    // http.Client client = http.Client();
  apiService = getIt.get<ApiService>();

  test("fetch all top headlines, convert them to a Map and then print it out",
      () async {
    News news = await apiService.fetchNews(
      client: apiService.httpClient,
      url: apiService.getTopHeadLinesURL,
      headers: {'X-Api-Key': apiService.getAPIKey},
    );
    print(news);
  });

  // test('print list of articles line by line', () async {
  //   // modelView.getArticles();
  //   List<Map<String, dynamic>> listOfArticle = await modelView.getArticles();
  //   for (int index = 0; index < listOfArticle.length; index++) {
  //     print(listOfArticle[index]);
  //   }
  // });
}
