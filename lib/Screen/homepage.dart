import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:practice/Screen/login.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    Color background = Theme.of(context).colorScheme.surface;
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FirebaseAuth.instance.currentUser != null  ? Image.network(
              FirebaseAuth.instance.currentUser!.photoURL.toString(),
              height: 100,
              width: 100,
            ) : const Text(''),
            FirebaseAuth.instance.currentUser != null
                ? Text(
                    FirebaseAuth.instance.currentUser!.displayName.toString())
                : const Text(''),
            FirebaseAuth.instance.currentUser != null
                ? Text(FirebaseAuth.instance.currentUser!.email.toString())
                : const Text(''),
            ElevatedButton(
                onPressed: () async {
                  await GoogleSignIn().signOut();
                  await FacebookAuth.instance.logOut();
                  await FirebaseAuth.instance.signOut().then(
                    (value) {
                      Get.offAll(const Login());
                    },
                  );
                },
                child: const Text('Sign out')),
          ],
        ),
      ),
    );
  }
}
