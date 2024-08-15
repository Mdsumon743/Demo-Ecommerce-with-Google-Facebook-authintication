import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/Controller/auth_controller.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final authcontrller = Get.put(AuthControllerSingout());
    Color background = Theme.of(context).colorScheme.surface;
    return  Scaffold(
      backgroundColor: background,
      body:  Center(
        child: ElevatedButton(onPressed: (){
          authcontrller.singOut();
        }, child:const  Text('Sign out')),
      ),
    );
  }
}
