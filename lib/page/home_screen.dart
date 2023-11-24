// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:excercise/cubit/home_cubit.dart';
import 'package:excercise/repo/modals/home_response.dart';
import 'package:excercise/repo/repository.dart';
import 'package:excercise/res/excercise_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif/gif.dart';
// import 'package:flutter_gif/flutter_gif.dart';

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
  void dispose() {
    // TODO: implement initState
    super.initState();
    cubit.controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    cubit.init(context: context);
    cubit.controller = GifController(vsync: this);

    return BlocConsumer<HomeCubit, HomeState>(
      bloc: cubit,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0xFF27282A),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    state.when(
                        initial: () => Container(),
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errors: () => Container(),
                        sucess: (response) => GridView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 15).copyWith(top: 100),
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, // number of items in each row
                              mainAxisSpacing: 12, // spacing between rows
                              crossAxisSpacing: 12, // spacing between columns
                              mainAxisExtent: 151
                          ),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ExcerciseWidgets.homeListElement(
                                selected: cubit.selectedIndex.contains(index),
                                onChanged: () => cubit.onValueChanged(index: index),
                                controller: cubit.controller,
                                imageUrl: 'https://media.self.com/photos/61d31f66f31786bad768890d/master/w_320%2Cc_limit/Jowan_10.gif',
                                size: cubit.size,
                                title: "${response.equipments!.elementAt(index).name}");
                          },
                          itemCount: response.equipments!.length,
                        )),
                  ],
                ),
              ),

              const SizedBox(height: 15,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      child: Text('Refresh Button',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))


                      ),
                      onPressed: () {
                        cubit.getData();
                      },
                    ),
                    ElevatedButton(
                      child: Text('SnackBar Button',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                      ),
                      onPressed: () {

                        final snackdemo = SnackBar(
                          content: Text('Please select any three'),
                          backgroundColor: Colors.black,
                          elevation: 10,
                          behavior: SnackBarBehavior.floating,
                          padding: EdgeInsets.symmetric(vertical: 25,horizontal: 12),
                          margin: EdgeInsets.zero,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackdemo);


                      },
                    ),
                  ],
                ),
              )


            ],
          )
        );
      },
    );
  }
}
