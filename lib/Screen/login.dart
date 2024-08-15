import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/Controller/auth_controller.dart';
import 'package:practice/Controller/controller.dart';
import 'package:practice/Custom_Widget/custom_button.dart';
import 'package:practice/Custom_Widget/custom_signin_option.dart';
import 'package:practice/Custom_Widget/custom_text.dart';
import 'package:practice/Custom_Widget/custom_textfeild.dart';
import 'package:practice/Screen/signup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Color background = Theme.of(context).colorScheme.surface;
    Color text = Theme.of(context).colorScheme.onSurface;
    Color button = Theme.of(context).colorScheme.primary;
    final size = MediaQuery.sizeOf(context);
    var from = GlobalKey<FormState>();
    final controller = Get.put(Visible());
    final authcontroller = Get.put(AuthControllerSingIn());
    final email = authcontroller.lEmail;
    final password = authcontroller.lPassword;

    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: from,
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
                      height: size.height * 0.04,
                    ),
                    CustomTextFeild(
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter email';
                        }
                        return null;
                      },
                      textEditingController: email,
                      radius: true,
                      secure: false,
                      hint: 'Email',
                      textInputType: TextInputType.emailAddress,
                      icon: const Icon(Icons.email_rounded),
                    ),
                    Obx(
                      () => CustomTextFeild(
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter password';
                          } else if (value.length < 6) {
                            return 'at last 6 digit password';
                          }
                          return null;
                        },
                        textEditingController: password,
                        radius: false,
                        secure: controller.visible.value,
                        suffixicon: IconButton(
                            onPressed: () {
                              controller.changeVisible();
                            },
                            icon: controller.visible.value == false
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility)),
                        hint: 'Password',
                        icon: const Icon(Icons.vpn_key_sharp),
                        textInputType: TextInputType.visiblePassword,
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {},
                          child: CustomText(
                              textAlign: TextAlign.start,
                              tittle: 'forgot password?',
                              color: button,
                              fontWeight: FontWeight.w400,
                              size: 14),
                        )),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Obx(
                      () => authcontroller.isLoad.value
                          ? const CircularProgressIndicator()
                          : CustomButton(
                              tittle: 'Sign in',
                              onTap: () {
                                if (from.currentState!.validate()) {
                                  authcontroller.signIn();
                                }
                                null;
                              },
                            ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    CustomText(
                        tittle: 'or',
                        color: text,
                        fontWeight: FontWeight.w500,
                        size: 14),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomSigninOption(
                          onTap: () {},
                          path: 'assets/images/google.png',
                        ),
                        CustomSigninOption(
                          onTap: () {},
                          path: 'assets/images/facebook.png',
                        ),
                        CustomSigninOption(
                          onTap: () {},
                          color: text,
                          path: 'assets/images/apple.png',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                            tittle: 'No account?',
                            color: text,
                            fontWeight: FontWeight.w400,
                            size: 16),
                        GestureDetector(
                          onTap: () {
                            Get.to(const Signup());
                          },
                          child: CustomText(
                              tittle: ' Sign up',
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
      ),
    );
  }
}
