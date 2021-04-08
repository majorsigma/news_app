import 'package:get_it/get_it.dart';
import 'package:news_app/services/api_service.dart';
import 'package:http/http.dart' as http;

GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<ApiService>(ApiService(httpClient: http.Client()));
}
