import 'package:bloc/bloc.dart';
import 'package:excercise/repo/modals/home_response.dart';
import 'package:excercise/repo/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());

  late FlutterGifController controller;
  HomeRespone? response;
  List<int> selectedIndex = [];
  late double size;

  init({required BuildContext context}) {
    size = MediaQuery.of(context).size.width / 3 - 30;
  }

  getData() async {
    emit(const HomeState.initial());
    emit(const HomeState.loading());
    response = await Repository.getHomePageData();
    emit(HomeState.sucess(response!));
  }

  onValueChanged({required index}) {
    if (selectedIndex.contains(index)) {
      selectedIndex.removeWhere((element) => element == index);
    } else if (selectedIndex.length < 3) {
      selectedIndex.add(index);
    }
  }
}
