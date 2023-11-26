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
  List<Equipments> homeResponseList = [];

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

Widget homeList(){
  return GridView.builder(
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
          onChanged: () {
            cubit.onValueChanged(index: index);
          },
          controller: cubit.controller,
          imageUrl: 'https://media.self.com/photos/61d31f66f31786bad768890d/master/w_320%2Cc_limit/Jowan_10.gif',
          size: cubit.size,
          title: "${homeResponseList.elementAt(index).name}");
    },
    itemCount: homeResponseList.length,
  );
}

// SnackBar Alert
void snackBarAlert({String? message = "Please select any three", bool? isError = false}){
     final snackDemo = SnackBar(
      content: Text('$message',style: TextStyle(color:  isError!?Colors.red:Colors.white,),textAlign: TextAlign.center,),
      backgroundColor: isError!?Colors.white:Colors.black,
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 12),
      margin: EdgeInsets.symmetric(horizontal: 5),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackDemo);
}
  @override
  Widget build(BuildContext context) {
    cubit.init(context: context);
    cubit.controller = GifController(vsync: this);
    return BlocConsumer<HomeCubit, HomeState>(
      bloc: cubit,
      listener: (context, state) {
        // TODO: implement listener
        if(state == HomeState.errors()){
          snackBarAlert(message: "Sorry you can't select more than three!",isError: true);
        }
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
                        errors: () => homeList(),
                        onSelect: (selectedIndex)=> homeList(),
                        sucess: (response) {
                          homeResponseList = response.equipments!;
                         return homeList();
                        }
                            ),
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
                        snackBarAlert();
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
