import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:lottie/lottie.dart';
import 'package:practice/Screen/homepage.dart';
import 'package:practice/Screen/login.dart';
import 'package:practice/Screen/onbordscreen/onbordscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Custom_Widget/custom_text.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  getData() async {
    final setData = await SharedPreferences.getInstance();
    bool getData = setData.getBool('ontime') ?? true;
    final user = FirebaseAuth.instance.currentUser;

    if (getData == true) {
      Get.offAll(const OnBordScreen());
    } else if(user != null) {
      Get.offAll(const Homepage());
    }else {
      Get.offAll(const Login());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
      const Duration(seconds: 5),
      () {
        getData();
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    Color background = Theme.of(context).colorScheme.surface;
    Color text = Theme.of(context).colorScheme.onSurface;
    Color button = Theme.of(context).colorScheme.primary;

    return Scaffold(
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                    tittle: 'HINT',
                    color: button,
                    fontWeight: FontWeight.w700,
                    size: 28),
                CustomText(
                    tittle: 'LY',
                    color: text,
                    fontWeight: FontWeight.w700,
                    size: 28),
              ],
            ),

            SizedBox(
              height: 150,
              width: 200,
              child: Lottie.asset('assets/anim/loading.json',

                  fit: BoxFit.contain),
            ),
          ],
        ),
      ),
    );
  }
}
