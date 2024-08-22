import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/Controller/controller.dart';

class CustomTextFeild2 extends StatelessWidget {
  final bool radius;
  final String hint;
  final Icon? icon;
  final IconButton? suffixicon;
  final bool secure;

  final TextInputType? textInputType;
  final String? Function(String?)? validate;
  final TextEditingController? textEditingController;

  const CustomTextFeild2(
      {super.key,
        required this.radius,
        required this.hint,
        this.icon,
        required this.secure,
        this.textInputType,
        this.validate,
        this.textEditingController,
        this.suffixicon,});

  @override
  Widget build(BuildContext context) {
    final enable = Get.put(Visible());
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(3),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: radius == true
              ? const BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10))
              : const BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10))),
      child: Center(
        child:Obx(() =>  TextFormField(
          enabled: enable.enable.value,
          controller: textEditingController,
          validator: validate,
          keyboardType: textInputType,
          obscureText: secure,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: icon,
            suffixIcon: suffixicon,
            hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 15,
                fontWeight: FontWeight.w500),
            contentPadding: const EdgeInsets.all(11.5),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
          ),
        ),
        )
      ),
    );
  }
}
