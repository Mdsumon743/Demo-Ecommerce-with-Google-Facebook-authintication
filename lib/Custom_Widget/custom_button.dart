import 'package:flutter/material.dart';
import 'package:practice/Custom_Widget/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String tittle;
  final void Function()? onTap;
  const CustomButton({super.key, required this.tittle, this.onTap});

  @override
  Widget build(BuildContext context) {
    Color text = Theme.of(context).colorScheme.onSurface;
    Color button = Theme.of(context).colorScheme.primary;
    return InkWell(
      hoverColor: text.withOpacity(0.5),
      hoverDuration: const Duration(seconds: 1),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: button,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: CustomText(
          tittle: tittle,
          color: text,
          fontWeight: FontWeight.w700,
          size: 18,
          textAlign: TextAlign.center,
        )),
      ),
    );
  }
}
