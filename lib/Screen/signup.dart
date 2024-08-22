import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/Controller/auth_controller.dart';
import 'package:practice/Controller/controller.dart';
import 'package:practice/Custom_Widget/custom_button.dart';
import 'package:practice/Custom_Widget/custom_textfeild.dart';
import 'package:practice/Screen/login.dart';
import '../Custom_Widget/custom_text.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    Color background = Theme.of(context).colorScheme.surface;
    Color text = Theme.of(context).colorScheme.onSurface;
    Color button = Theme.of(context).colorScheme.primary;
    final size = MediaQuery.sizeOf(context);
    final controller = Get.put(Visible());
    final authController = Get.put(AuthControllerSingUp());

    var form = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        scrolledUnderElevation: 0,
      ),
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: form,
          child: Center(
            child: SingleChildScrollView(
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
                    height: size.height * 0.02,
                  ),
                  CustomTextFeild(
                    enable: true,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter name';
                      }
                      return null;
                    },
                    textEditingController: authController.sName,
                    radius: true,
                    hint: 'Name',
                    secure: false,
                    textInputType: TextInputType.text,
                  ),
                  CustomTextFeild(
                    enable: true,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter email';
                      } else if (EmailValidator.validate(
                          authController.sEmail.text)) {
                        return null;
                      } else {
                        return 'Email not valid';
                      }
                    },
                    textEditingController: authController.sEmail,
                    radius: false,
                    hint: 'Email',
                    secure: false,
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Obx(
                    () => CustomTextFeild(
                      enable: true,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter password';
                        } else if (value.length < 6) {
                          return 'at last 6 digit password';
                        }
                        return null;
                      },
                      secure: controller.visible.value,
                      suffixicon: IconButton(
                          onPressed: () {
                            controller.changeVisible();
                          },
                          icon: controller.visible.value == true
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility)),
                      textEditingController: authController.sPassword,
                      radius: true,
                      hint: 'Password',
                      textInputType: TextInputType.visiblePassword,
                    ),
                  ),
                  Obx(
                    () => CustomTextFeild(
                      enable: true,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Confirm password';
                        } else if (value != authController.sPassword.text) {
                          return 'Password not match';
                        }
                        return null;
                      },
                      secure: controller.visible2.value,
                      suffixicon: IconButton(
                          onPressed: () {

                            controller.changeVisible2();
                          },
                          icon: controller.visible2.value == true
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility)),
                      textEditingController: authController.sConfirmpassword,
                      radius: false,
                      hint: 'Confirm Password',
                      textInputType: TextInputType.visiblePassword,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Obx(
                    () => authController.isLoad.value
                        ? const CircularProgressIndicator()
                        : CustomButton(
                            tittle: 'Sing up',
                            onTap: () {
                              if (form.currentState!.validate()) {
                                authController.signup();
                              }
                            },
                          ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                          tittle: 'Already account?',
                          color: text,
                          fontWeight: FontWeight.w400,
                          size: 16),
                      GestureDetector(
                        onTap: () {
                          Get.offAll(const Login());
                        },
                        child: CustomText(
                            tittle: ' Sign in',
                            color: button,
                            fontWeight: FontWeight.w400,
                            size: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
