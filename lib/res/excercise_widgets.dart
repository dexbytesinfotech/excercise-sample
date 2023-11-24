import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';

abstract class ExcerciseWidgets {
  static Widget homeListElement(
          {required bool selected,
          required String imageUrl,
          required void Function() onChanged,
          required FlutterGifController controller,
          required double size,
          required String title}) =>
      GestureDetector(
        onTap: onChanged,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Container(
                height: size,
                width: size,
                color: Colors.white,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    GifImage(
                      controller: controller,
                      image: NetworkImage(imageUrl),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        activeColor: Colors.amber,
                        tristate: true,
                        value: selected,
                        onChanged: (value) {},
                      ),
                    )
                  ],
                ),
              ),
            ),
            Text(
              title,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      );
}
