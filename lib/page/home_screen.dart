import 'package:excercise/cubit/home_cubit.dart';
import 'package:excercise/repo/modals/home_response.dart';
import 'package:excercise/repo/repository.dart';
import 'package:excercise/res/excercise_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gif/flutter_gif.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  HomeCubit cubit = HomeCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit.getData();
  }

  @override
  Widget build(BuildContext context) {
    cubit.init(context: context);
    cubit.controller = FlutterGifController(vsync: this);

    return BlocConsumer<HomeCubit, HomeState>(
      bloc: cubit,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: SizedBox(
              height: cubit.size + 55,
              child: state.when(
                  initial: () => Container(),
                  loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                  errors: () {},
                  sucess: (response) => ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ExcerciseWidgets.homeListElement(
                              selected: cubit.selectedIndex.contains(index),
                              onChanged: () =>
                                  cubit.onValueChanged(index: index),
                              controller: cubit.controller,
                              imageUrl:
                                  'https://media.self.com/photos/61d31f66f31786bad768890d/master/w_320%2Cc_limit/Jowan_10.gif',
                              size: cubit.size,
                              title:
                                  "${response.equipments!.elementAt(index).name}");
                        },
                        itemCount: response.equipments!.length,
                      )),
            ),
          ),
        );
      },
    );
  }
}
