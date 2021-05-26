import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontsize;
  final Color color;
  final Alignment alignment;
  final int maxline;

  final FontWeight fontweight;

  const CustomText({
    Key key,
    this.text = "",
    this.fontsize = 30,
    this.color = Colors.black,
    this.alignment = Alignment.topLeft,
    this.maxline,
    this.fontweight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: fontweight,
          color: color,
          fontSize: fontsize,
        ),
        maxLines: maxline,
      ),
    );
  }
}
