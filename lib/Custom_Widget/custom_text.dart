import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String tittle;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final double size;
  const CustomText(
      {super.key,
      required this.tittle,
      required this.color,
      required this.fontWeight,
      required this.size,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      tittle,
      style: TextStyle(color: color, fontWeight: fontWeight, fontSize: size),
    );
  }
}
