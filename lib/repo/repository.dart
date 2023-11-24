import 'package:dio/dio.dart';
import 'package:excercise/repo/modals/home_response.dart';

abstract class Repository {
  static Dio dio = Dio();

  static Future<HomeRespone> getHomePageData() async {
    Response response;
    response = await dio.get(
        'https://fbk-assets-dev.s3.us-west-2.amazonaws.com/GymEquipments.json');
    print(response.data.toString());
    // The below request is the same as above.

    return HomeRespone.fromJson(response.data);
  }
}
