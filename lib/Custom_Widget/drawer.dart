import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:practice/Controller/controller.dart';
import 'package:practice/Screen/account.dart';

import '../Screen/login.dart';
import 'custom_text.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Color background = Theme.of(context).colorScheme.surface;
    Color container = Theme.of(context).colorScheme.onPrimary;
    Color text = Theme.of(context).colorScheme.onSurface;
    final currentUser = FirebaseAuth.instance.currentUser;
    final theme = Get.put(ThemeChange());
    return SafeArea(
      child: Drawer(
        elevation: 10,
        child: Column(
          children: [
            DrawerHeader(
                margin: const EdgeInsets.all(5),
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
                decoration: BoxDecoration(
                  color: background,
                  borderRadius:
                      const BorderRadius.only(topRight: Radius.circular(10)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          color: container,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: currentUser!= null ? NetworkImage(FirebaseAuth
                                  .instance.currentUser!.photoURL
                                  .toString()) : const AssetImage('')) ),
                    ),
                    CustomText(
                        tittle: currentUser != null
                            ? FirebaseAuth.instance.currentUser!.displayName
                                .toString()
                            : FirebaseFirestore.instance.doc(currentUser!.email.toString()).get().toString(),
                        color: text,
                        fontWeight: FontWeight.w500,
                        size: 16),
                    CustomText(
                        tittle: currentUser.email  != null
                            ? FirebaseAuth.instance.currentUser!.email
                                .toString()
                            : const Text('').toString(),
                        color: text,
                        fontWeight: FontWeight.w400,
                        size: 16),
                  ],
                )),
            ListTile(
              onTap: () {
                Get.to(const Account());
              },
              leading: Image.asset(
                'assets/images/user.png',
                height: 40,
                width: 40,
              ),
              title: CustomText(
                  tittle: 'Account',
                  color: text,
                  fontWeight: FontWeight.w500,
                  size: 18),
            ),
            ListTile(
              onTap: () {
                theme.changeTheme();
              },
              leading: Obx(
                () => theme.isDark.value
                    ? Image.asset('assets/images/brightness.png',
                        height: 40, width: 40)
                    : Image.asset('assets/images/night-mode.png',
                        height: 40, width: 40),
              ),
              title: CustomText(
                  tittle: 'Theme',
                  color: text,
                  fontWeight: FontWeight.w500,
                  size: 18),
            ),
            ListTile(
              onTap: () {
                Get.defaultDialog(
                    title: 'Logout',
                    titleStyle: TextStyle(
                        color: text, fontWeight: FontWeight.w500, fontSize: 16),
                    content: CustomText(
                        tittle: 'Are you sure',
                        color: text,
                        fontWeight: FontWeight.w500,
                        size: 16),
                    backgroundColor: background.withOpacity(1),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('No')),
                      TextButton(
                          onPressed: () {
                            GoogleSignIn().signOut();
                            FacebookAuth.instance.logOut();
                            FirebaseAuth.instance.signOut().then(
                              (value) {
                                Get.offAll(const Login());
                              },
                            );
                          },
                          child: const Text('Yes')),
                    ]);
              },
              leading: Image.asset('assets/images/logout.png',
                  height: 40, width: 40),
              title: CustomText(
                  tittle: 'Logout',
                  color: text,
                  fontWeight: FontWeight.w500,
                  size: 18),
            ),
            ListTile(
              onTap: () {},
              leading: Image.asset('assets/images/customer-service.png',
                  height: 40, width: 40),
              title: CustomText(
                  tittle: 'Help',
                  color: text,
                  fontWeight: FontWeight.w500,
                  size: 18),
            ),
            ListTile(
              onTap: () {},
              leading: Image.asset('assets/images/settings.png',
                  height: 40, width: 40),
              title: CustomText(
                  tittle: 'Setting',
                  color: text,
                  fontWeight: FontWeight.w500,
                  size: 18),
            ),
            ListTile(
              onTap: () {},
              leading: Image.asset('assets/images/switch.png',
                  height: 40, width: 40),
              title: CustomText(
                  tittle: 'Exit',
                  color: text,
                  fontWeight: FontWeight.w500,
                  size: 18),
            ),
          ],
        ),
      ),
    );
  }
}
