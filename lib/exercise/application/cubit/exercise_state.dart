part of 'exercise_cubit.dart';

@freezed
class ExerciseState with _$ExerciseState {
  // const factory HomeState.initial() = _Initial;
  // const factory HomeState.loading() = _loading;
  // const factory HomeState.errors() = _errors;
  // const factory HomeState.sucess(ExerciseModel response) = _sucess;
  // const factory HomeState.selectedItemList(List<int> result) = _select;

  const factory ExerciseState({
    @Default(false) bool isLoading, String? error ,ExerciseModel? user, @Default([]) List<int> selectedOption, @Default(0) int selectedCount
}) = _user;

}

// abstract class ButtonPressed implements HomeState {}
