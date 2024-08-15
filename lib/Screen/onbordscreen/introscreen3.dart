import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:practice/Custom_Widget/custom_text.dart';

class Introscreen3 extends StatelessWidget {
  const Introscreen3({super.key});

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
                'assets/anim/anim5.json',
                height: size.height * 0.4,
                width: size.width * 0.8,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
               CustomText(
                  textAlign: TextAlign.center,
                  tittle: 'Super \n Fast Delivery',
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
