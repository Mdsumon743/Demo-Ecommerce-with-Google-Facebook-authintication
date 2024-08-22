import 'package:flutter/material.dart';

import 'package:practice/Custom_Widget/custom_text.dart';

class CustomItemCatagory extends StatelessWidget {
  final String image;
  final String tittle;
  final Color? color;
  const CustomItemCatagory({super.key, required this.image, required this.tittle,  this.color});

  @override
  Widget build(BuildContext context) {
    
    Color container = Theme.of(context).colorScheme.onPrimary;
    Color text = Theme.of(context).colorScheme.onSurface;
   // final select = Get.put(ItemSelect());
    return InkWell(
      child: Container(
      padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          color: container,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(image,height: 30,width: 30,),
              CustomText(tittle: tittle, color: text, fontWeight: FontWeight.w500, size: 15)
            ],
          ),
        ),

      ),
    );
  }
}
