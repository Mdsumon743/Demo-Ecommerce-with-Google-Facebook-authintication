import 'package:flutter/material.dart';

class CustomSigninOption extends StatelessWidget {
  final String path;
  final Color? color;
  final void Function() onTap;
  const CustomSigninOption({super.key, required this.path, this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding:const  EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 0.8,

          )
        ),
        child: Center(
          child: Image.asset(path,height: 30,width: 30,color: color,),
        ),
      ),
    );
  }
}
