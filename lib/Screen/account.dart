import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/Controller/controller.dart';
import 'package:practice/Custom_Widget/custom_button.dart';
import 'package:practice/Custom_Widget/custom_textfeild2.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    // Color background = Theme.of(context).colorScheme.surface;
    Color container = Theme.of(context).colorScheme.onPrimary;
    Color button = Theme.of(context).colorScheme.primary;
    final enable = Get.put(Visible());
    //Color text = Theme.of(context).colorScheme.onSurface;

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: button,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              Stack(alignment: Alignment.bottomCenter, children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: button,
                  ),
                  child: Center(
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          color: container,
                          border: Border.all(
                            color: Colors.white,
                            width: 5,
                          ),
                          
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(FirebaseAuth
                                  .instance.currentUser!.photoURL
                                  .toString()),
                              fit: BoxFit.contain)),
                    ),
                  ),
                ),
                Obx(() => enable.enable.value == true
                    ? Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Icon(
                          Icons.camera_alt_rounded,
                          color: button,
                        ),
                      )
                    : const SizedBox())
              ]),
              const Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    CustomTextFeild2(
                      radius: true,
                      hint: 'Name : Sumon',
                      secure: false,
                    ),
                    CustomTextFeild2(
                      radius: false,
                      hint: 'Email : mdsumonhossan743@gmail.com',
                      secure: false,
                    ),
                    CustomTextFeild2(
                      radius: true,
                      hint: 'Phone : 01569897455',
                      secure: false,
                    ),
                    CustomTextFeild2(
                      radius: false,
                      hint: 'Address : Dhaka,Gazipur',
                      secure: false,
                    ),
                    CustomTextFeild2(
                      radius: true,
                      hint: 'Gender : Male',
                      secure: false,
                    ),
                    CustomTextFeild2(
                      radius: false,
                      hint: 'Date of birth : 19/5/2004',
                      secure: false,
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(15),
                  child: Obx(
                    () => CustomButton(
                      tittle: enable.enable.value == false
                          ? 'Edit Profile'
                          : 'Save',
                      onTap: () {
                        enable.changeEnable();
                      },
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
