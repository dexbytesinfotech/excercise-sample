import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

abstract class ExcerciseWidgets {
  static Widget homeListElement(
      {required bool selected,
      required String imageUrl,
      required void Function() onChanged,
      required GifController controller,
      required double size,
      required String title}) {

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
                    child: CustomCheckbox(
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
}


class CustomCheckbox extends StatefulWidget {
  CustomCheckbox({
    Key? key,
    this.width = 18.0,
    this.height = 18.0,
    this.color,
    this.iconSize,
    this.isCheck = false,
    this.checkColor,
  }) : super(key: key);

  final double width;
  final double height;
  final Color? color;

  // Now you can set the checkmark size of your own
  final double? iconSize;
  final Color? checkColor;
  bool isCheck;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    isChecked =  widget.isCheck;
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(right: 8, bottom: 8),
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.color ?? const Color(0xFF27282A),
          width: 1.2,
        ),
        color: isChecked ? const Color(0xFF27282A) : Colors.white,
        shape: BoxShape.circle,
      ),
      child: isChecked
          ? Icon(
        Icons.check_rounded,
        size: 12,
        color: widget.checkColor,
      )
          : null,
    );

  }
}
