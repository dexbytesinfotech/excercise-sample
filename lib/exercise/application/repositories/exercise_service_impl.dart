import 'package:exercise/exercise/domain/exercise_model.dart';

abstract class ExerciseServiceImpl {
  Future<ExerciseModel> loadInitialData();
}


