import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../Custom_Widget/custom_text.dart';

class Introscreen2 extends StatelessWidget {
  const Introscreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      decoration:  BoxDecoration(color: Theme.of(context).colorScheme.surface),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/anim/shop.json',
                height: size.height * 0.4,
                width: size.width * 0.8,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
               CustomText(
                  textAlign: TextAlign.center,
                  tittle: 'Get \n All Item',
                  color:  Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                  size: 20)
            ],
          ),
        ),
      ),
    );
  }
}
