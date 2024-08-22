import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String tittle;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final double size;
  final TextOverflow? textOverflow;
  final int? maxline;
  const CustomText(
      {super.key,
      required this.tittle,
      required this.color,
      required this.fontWeight,
      required this.size,
      this.textAlign, this.textOverflow, this.maxline});

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: textOverflow,
      textAlign: textAlign,
      maxLines: maxline,
      tittle,
      style: TextStyle(color: color, fontWeight: fontWeight, fontSize: size),
    );
  }
}
