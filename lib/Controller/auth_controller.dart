import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:practice/Screen/homepage.dart';
import 'package:practice/Screen/login.dart';

class AuthControllerSingUp extends GetxController {
  final sEmail = TextEditingController();
  final sPassword = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxBool isLoad = false.obs;

  Future<void> signup() async {
    isLoad.value = true;
    Timer(const Duration(seconds: 1), () async {
      try {
        await _auth.createUserWithEmailAndPassword(
          email: sEmail.text,
          password: sPassword.text,
        );

        Get.offAll(const Homepage());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          isLoad.value = false;
          Get.snackbar(
              '❌ Error',
              snackPosition: SnackPosition.TOP,
              'This password is week');
        } else if (e.code == 'email-already-in-use') {
          isLoad.value = false;
          Get.snackbar(
              '❌ Error',
              snackPosition: SnackPosition.TOP,
              ' Already use this email');
        } else {
          isLoad.value = false;
          Get.snackbar(
              '❌ Error',
              snackPosition: SnackPosition.TOP,
              ' Not a valid email');
        }
      } catch (e) {
        return;
      }
    });
  }
}

class AuthControllerSingIn extends GetxController {
  final lEmail = TextEditingController();
  final lPassword = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxBool isLoad = false.obs;
  Future<void> signIn() async {
    try {
      isLoad.value = true;
      await _auth
          .signInWithEmailAndPassword(
              email: lEmail.text, password: lPassword.text)
          .then((value) {
        Get.offAll(const Homepage());
      },
      ).onError(
        (error, stackTrace) {
          Get.snackbar('❌ Error', 'Please check email & password is correct ?');
        },
      );
    } catch (e){
      return;
    }
    isLoad.value = false;
  }
}

class AuthControllerSingout extends GetxController {
  final auth = FirebaseAuth.instance;
  singOut() async {
    await auth.signOut();
    Get.offAll(const Login());
  }
}
