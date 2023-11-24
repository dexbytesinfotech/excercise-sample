// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
// import 'package:flutter_gif/flutter_gif.dart';

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
                      isCheck: selected,
                      onChanged: (value) {
                        onChanged;
                      },
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
    this.onChanged,
    this.checkColor,
  }) : super(key: key);

  final double width;
  final double height;
  final Color? color;

  // Now you can set the checkmark size of your own
  final double? iconSize;
  final Color? checkColor;
  bool isCheck;
  final Function(bool?)? onChanged;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    bool isChecked = widget.isCheck;

    return InkWell(
      onTap: () {
        setState(() => isChecked = !isChecked);
        widget.onChanged?.call(isChecked);
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(right: 8, bottom: 8),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.color ?? Color(0xFF27282A),
            width: 1.2,
          ),
          color: isChecked ? Color(0xFF27282A) : Colors.white,
          shape: BoxShape.circle,
        ),
        child: isChecked
            ? Icon(
                Icons.check_rounded,
                size: 12,
                color: widget.checkColor,
              )
            : null,
      ),
    );
  }
}
