import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

class ExerciseCardWidget extends StatelessWidget  {
   final bool selected;
   final String imageUrl;
   final Function() onChanged;
   final GifController controller;
   final  double size;
   final  String title;
  const ExerciseCardWidget({super.key, required this.selected,
    required this.imageUrl,
    required this.onChanged,
    required this.controller,
    required this.size,
    required this.title});


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onChanged,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              height: size,
              width: size,
              color: Colors.white,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Gif(
                    image: NetworkImage(imageUrl),
                    controller: controller,
                    autostart: Autostart.no,
                    placeholder: (context) => const Center(child:Text('Loading...')),
                    onFetchCompleted: () {
                      controller.repeat();
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: borderedTextCheckBox(
                        checkColor: const Color(0xFF0DC7B1),
                        isCheck: selected
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
                color: Color(0xFFFFFEFF),
                fontSize: 14,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }

  Widget borderedTextCheckBox ({Color? checkColor = const Color(0xFF0DC7B1),
  bool isCheck = false})
  {
     double width = 18.0;
     double height = 18.0;
     Color? color = const Color(0xFF27282A);

    return Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.only(right: 8, bottom: 8),
    width: width,
    height: height,
    decoration: BoxDecoration(
      border: Border.all(
        color: color,
        width: 1.2,
      ),
      color: isCheck ? checkColor : Colors.white,
      shape: BoxShape.circle,
    ),
    child: isCheck
        ? Icon(
      Icons.check_rounded,
      size: 12,
      color: checkColor,
    )
        : null,
  );
  }
}

