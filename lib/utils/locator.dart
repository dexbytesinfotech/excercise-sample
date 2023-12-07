import 'package:dio/dio.dart';
import 'package:exercise/application/generic_api_dio_interceptor.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Locator {
  static final GetIt instance = GetIt.instance;

  Future<void> setupLocator() async {
    // Register Dio
    Dio dio = Dio();
    instance.registerSingleton<Dio>(dio);
    dio.interceptors.add(GenericApiDioInterceptor());

    //Register SharedPreferences;
    instance.registerSingletonAsync<SharedPreferences>(() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs;
    },signalsReady: true);

  }
}