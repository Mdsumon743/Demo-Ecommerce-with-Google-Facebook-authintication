import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:practice/Custom_Widget/custom_text.dart';
import 'package:practice/Screen/login.dart';
import 'package:practice/Screen/onbordscreen/introscreen1.dart';
import 'package:practice/Screen/onbordscreen/introscreen2.dart';
import 'package:practice/Screen/onbordscreen/introscreen3.dart';
import 'package:practice/Screen/onbordscreen/introscreen4.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBordScreen extends StatefulWidget {
  const OnBordScreen({super.key});

  @override
  State<OnBordScreen> createState() => _OnBordScreenState();
}

class _OnBordScreenState extends State<OnBordScreen> {
  PageController controller = PageController();
  bool lastPage = false;
  setPage() async {
    final setData = await SharedPreferences.getInstance();
    setData.setBool('ontime', false);
  }

  @override
  void initState() {
    super.initState();
    setPage();
  }

  @override
  Widget build(BuildContext context) {
    Color background = Theme.of(context).colorScheme.surface;
    return Scaffold(
      backgroundColor: background,
        body: Stack(
      children: [
        PageView(
          onPageChanged: (index) {
            setState(() {
              lastPage = (index == 3);
            });
          },
          controller: controller,
          children: const [
            Introscreen1(),
            Introscreen2(),
            Introscreen3(),
            Introscreen4(),
          ],
        ),
        Container(
            alignment: const Alignment(0, 0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {
                      controller.jumpToPage(3);
                    },
                    child:  CustomText(
                        tittle: 'Skip',
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                        size: 16)),
                SmoothPageIndicator(
                  effect: const ExpandingDotsEffect(
                      activeDotColor: Colors.white, dotColor: Colors.grey),
                  controller: controller,
                  count: 4,
                ),
                lastPage
                    ? TextButton(
                        onPressed: () {
                          Get.offAll(const Login());
                        },
                        child:  CustomText(
                            tittle: 'Done',
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.w600,
                            size: 16))
                    : TextButton(
                        onPressed: () {
                          controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child:  CustomText(
                            tittle: 'Next',
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.w600,
                            size: 16)),
              ],
            ))
      ],
    ));
  }
}
