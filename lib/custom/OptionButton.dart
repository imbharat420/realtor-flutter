import 'package:flutter/material.dart';
import 'package:retro_portal/utils/constants.dart';
import 'package:retro_portal/utils/widget_functions.dart';

class OptionButton extends StatelessWidget {
  final double width;
  final String text;
  final IconData icon;
  const OptionButton(
      {required this.icon, required this.width, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: COLOR_WHITE,
      minimumSize: Size(100, 44),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      backgroundColor: COLOR_DARK_BLUE,
    );

    return Container(
      width: width,
      child: TextButton(
        style: flatButtonStyle,
        onPressed: () {
          print('Button pressed');
        },
        child: Row(
          children: [
            Icon(
              icon,
              color: COLOR_WHITE,
            ),
            addHorizontalSpace(10),
            Text(
              text,
              style: TextStyle(color: COLOR_WHITE),
            )
          ],
        ),
      ),
    );
  }
}
