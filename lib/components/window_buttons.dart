import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dashboard/constants.dart';
import 'package:flutter/material.dart';

final buttonColors = WindowButtonColors(
  iconNormal: primaryColor,
  mouseOver: secondaryColor,
  mouseDown: primaryColor,
  iconMouseOver: primaryColor,
  iconMouseDown: secondaryColor,
);

final closeButtonColors = WindowButtonColors(
  mouseOver: const Color(0xFFD32F2F),
  mouseDown: const Color(0xFFB71C1C),
  iconNormal: const Color(0xFFEE2727),
  iconMouseOver: Colors.white,
);

class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        MaximizeWindowButton(colors: buttonColors),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}
