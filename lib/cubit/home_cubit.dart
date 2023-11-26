import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:excercise/repo/modals/home_response.dart';
import 'package:excercise/repo/repository.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gif/gif.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());

  late GifController controller;
  SharedPreferences? preferencesInstance;
  HomeRespone? response;
  List<int> selectedIndex = [];
  late double size;

  init({required BuildContext context}) {
    size = MediaQuery.of(context).size.width / 3.4;
  }

  getData() async {
    emit(const HomeState.initial());
    emit(const HomeState.loading());
    //Get data from shared preferences
    selectedIndex = await getListToSharedPreferences();

    //Get data from API
    response = await Repository.getHomePageData();
    emit(HomeState.sucess(response!));
  }

  //Call Method on click
  onValueChanged({required index}) {
    //Remove selected item on click again on same selected item
    if (selectedIndex.contains(index)) {
      selectedIndex.removeWhere((element) => element == index);
      saveListToSharedPreferences(selectedIndex);
      emit(const HomeState.loading());
      emit(HomeState.selectedItemList(selectedIndex));
    }
    //Add item according to condition user can select max 3 item from list
    else if (selectedIndex.length < 3) {
      selectedIndex.add(index);
      //Store selected data in shared preferences
      saveListToSharedPreferences(selectedIndex);
      emit(const HomeState.loading());
      emit(HomeState.selectedItemList(selectedIndex));
    }
    // Inform to user max selection limit
    else{
      emit(const HomeState.loading());
      emit(const HomeState.errors());
    }
  }

  // Save the list to shared preferences
  Future<void> saveListToSharedPreferences(List<int> selectedIndexList) async {
    try {
      preferencesInstance ??= await SharedPreferences.getInstance();
      final String jsonString = json.encode(selectedIndexList);
      await preferencesInstance!.setString('selectedList', jsonString);
    } catch (e) {
      print(e);
    }
  }

  // get the list from shared preferences
  Future<List<int>> getListToSharedPreferences() async {
    List<int>? selectedIndexList = [];
    try {
      preferencesInstance ??= await SharedPreferences.getInstance();
      String? selectedItemList = preferencesInstance!.getString('selectedList');
      if(selectedItemList!=null && selectedItemList.isNotEmpty){
        selectedIndexList =  json.decode(selectedItemList).cast<int>();
      }

    } catch (e) {
      print(e);
    }
 return selectedIndexList!;
  }
}
