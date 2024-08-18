import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:practice/Screen/homepage.dart';

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
          .then(
        (value) {
          Get.offAll(const Homepage());
        },
      ).onError(
        (error, stackTrace) {
          Get.snackbar('❌ Error', 'Please check email & password is correct ?');
        },
      );
    } catch (e) {
      return;
    }
    isLoad.value = false;
  }
}

class AuthControllerGoogle extends GetxController {
  final auth = FirebaseAuth.instance;
  RxBool isLoad = false.obs;
  Future<UserCredential?> signInWithGoogle() async {
    isLoad.value = true;
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    isLoad.value = false;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    isLoad.value = true;
    UserCredential userCrdiancial = await auth.signInWithCredential(credential);
    isLoad.value = true;
    Get.offAll(const Homepage());
    isLoad.value = false;
    return userCrdiancial;
  }
}

class AuthControllerFacebook extends GetxController {
  signinFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
        Get.offAll(const Homepage());
      // Once signed in, return the UserCredential
      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } catch (e) {
      return;
    }
  }
}
