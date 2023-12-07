import 'package:exercise/exercise/application/cubit/exercise_cubit.dart';
import 'package:exercise/exercise/domain/exercise_model.dart';
import 'package:exercise/exercise/presentation/exercise_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif/gif.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({super.key});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> with TickerProviderStateMixin {
  ExerciseCubit cubit = ExerciseCubit();
  List<Equipments> equipmentList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit.getData();
  }


@override
  void dispose() {
    // TODO: implement dispose
  cubit.controller.dispose();
    super.dispose();
  }

Widget exerciseEquipmentList(){
  return GridView.builder(
    padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 100),
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
      return ExerciseCardWidget(
          selected: cubit.selectedOption.contains(index),
          onChanged: () {
            cubit.onValueChanged(index: index);
          },
          controller: cubit.controller,
          imageUrl: 'https://media.self.com/photos/61d31f66f31786bad768890d/master/w_320%2Cc_limit/Jowan_10.gif',
          size: cubit.size,
          title: "${equipmentList.elementAt(index).name}");
    },
    itemCount: equipmentList.length,
  );
}

// SnackBar Alert
void snackBarAlert({String? message = "Please select any three", bool? isError = false}){
     final snackDemo = SnackBar(
      content: Text('$message',style: TextStyle(color:  isError!?Colors.red:Colors.white,),textAlign: TextAlign.center,),
      backgroundColor: isError?Colors.white:Colors.black,
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 12),
      margin: const EdgeInsets.symmetric(horizontal: 5),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackDemo);
}
  @override
  Widget build(BuildContext context) {
    cubit.init(context: context);
    cubit.controller = GifController(vsync: this);
    return BlocConsumer<ExerciseCubit, ExerciseState>(
      bloc: cubit,
      listener: (context, state) {
        // TODO: implement listener
        if(state.error!=null && state.error!.isNotEmpty){
          snackBarAlert(message: state.error!,isError: true);
        }
      },
      builder: (context, state) {

        //Display loader
        if(state.isLoading){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        //Load data
        if(state.user!=null){
          equipmentList = state.user!.equipments!;
        }
        return Scaffold(
          backgroundColor: const Color(0xFF27282A),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    exerciseEquipmentList(),
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
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                      ),
                      onPressed: () {
                        cubit.getData();
                      },
                      child: const Text('Refresh Button',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Colors.black)),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                      ),
                      onPressed: () {
                        snackBarAlert();
                      },
                      child: const Text('SnackBar Button',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Colors.black)),
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
