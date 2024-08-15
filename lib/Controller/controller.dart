import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeChange extends GetxController {
  RxBool isDark = false.obs;

  changeTheme() async {
    isDark.value = !isDark.value;
    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
  }
}

class Visible extends GetxController {
  RxBool visible = true.obs;
  RxBool visible2 = true.obs;

  changeVisible() {
    visible.value = !visible.value;
  }

  changeVisible2() {
    visible2.value = !visible2.value;
  }
}
