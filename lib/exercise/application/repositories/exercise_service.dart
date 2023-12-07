import 'package:dio/dio.dart';
import 'package:exercise/exercise/application/repositories/exercise_service_impl.dart';
import 'package:exercise/exercise/domain/exercise_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class ExerciseService extends ExerciseServiceImpl{

  @override
  Future<ExerciseModel> loadInitialData() async{
    final dio = GetIt.instance.get<Dio>();
    Response response =await dio.get(
        'https://fbk-assets-dev.s3.us-west-2.amazonaws.com/GymEquipments.json');
    debugPrint(response.data.toString());
    // The below request is the same as above.
    return ExerciseModel.fromJson(response.data);
  }

}


