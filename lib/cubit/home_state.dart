part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _loading;
  const factory HomeState.errors() = _errors;
  const factory HomeState.sucess(HomeRespone response) = _sucess;
  const factory HomeState.selectedItemList(List<int> result) = _select;
}

abstract class ButtonPressed implements HomeState {}
