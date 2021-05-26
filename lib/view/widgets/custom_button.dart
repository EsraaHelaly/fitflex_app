import 'package:fitflex_app/constants.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color;
  final Color textColor;

  const CustomButton({
    Key key,
    this.text,
    this.press,
    this.color = kprimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: press,
        child: Padding(
          padding: const EdgeInsets.all(7),
          child: CustomText(
            text: text,
            color: Colors.white,
            fontsize: 18,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
