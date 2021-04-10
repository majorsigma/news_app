import 'package:get_it/get_it.dart';
import 'package:news_app/services/api_service.dart';
import 'package:http/http.dart' as http;

GetIt getIt = GetIt.instance;

void setupGetIt() {
  
  // Registers the ApiService instance so that it can be assessed anywhere in the app 
  // to perform its functions.
  getIt.registerLazySingleton<ApiService>(() => ApiService(httpClient: http.Client()));
}
