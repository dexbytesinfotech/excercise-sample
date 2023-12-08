import 'dart:convert';
import 'package:exercise/exercise/application/repositories/exercise_service.dart';
import 'package:exercise/exercise/domain/exercise_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:gif/gif.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'exercise_state.dart';
part 'exercise_cubit.freezed.dart';

class ExerciseCubit extends Cubit<ExerciseState> {
  ExerciseCubit() : super(const ExerciseState());

  ExerciseModel? response;
  List<int> selectedOption = [];
  late double size;

  init({required BuildContext context}) {
    size = MediaQuery.of(context).size.width / 3.4;
  }

  getData() async {
    emit(state.copyWith(isLoading: true));
    //Get data from shared preferences
    selectedOption = await getListToSharedPreferences();
    //Get data from API service
    response = await ExerciseService().loadInitialData();
    emit(state.copyWith(isLoading: false,user: response!));
  }

  //Call Method on click
  void onValueChanged({required index}) {
    //Remove selected item on click again on same selected item
    if (selectedOption.contains(index)) {
      selectedOption.removeWhere((element) => element == index);
      saveListToSharedPreferences(selectedOption);
      emit(state.copyWith(error: "",selectedOption: selectedOption,selectedCount: selectedOption.length));
    }
    //Add item according to condition user can select max 3 item from list
    else if (selectedOption.length < 3) {
      selectedOption.add(index);
      //Store selected data in shared preferences
      saveListToSharedPreferences(selectedOption);
      emit(state.copyWith(error: "",selectedOption: selectedOption,selectedCount: selectedOption.length));
    }
    // Inform to user max selection limit
    else{
      emit(state.copyWith(error: "Sorry you can't select more than three!",selectedCount: selectedOption.length));
    }
  }

  // Save the list to shared preferences
  Future<void> saveListToSharedPreferences(List<int> selectedIndexList) async {
    try {
      final String jsonString = json.encode(selectedIndexList);
      // Fetch SharedPreferences from the service locator
      final sharedPreferences = await GetIt.instance.getAsync<SharedPreferences>();
      sharedPreferences.setString('selectedList', jsonString);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // get the list from shared preferences
  Future<List<int>> getListToSharedPreferences() async {
    List<int>? selectedIndexList = [];
    // Fetch SharedPreferences from the service locator
    try {
      final sharedPreferences = await GetIt.instance.getAsync<SharedPreferences>();
      String? selectedItemList = sharedPreferences.getString("selectedList");
      if(selectedItemList!=null && selectedItemList.isNotEmpty){
        selectedIndexList =  json.decode(selectedItemList).cast<int>();
      }
    } catch (e) {
      debugPrint("$e");
    }
    return selectedIndexList!;
  }
}
