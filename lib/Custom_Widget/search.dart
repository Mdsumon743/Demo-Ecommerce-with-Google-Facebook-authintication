import 'package:flutter/material.dart';
import 'package:practice/Custom_Widget/custom_text.dart';

class CustomSearch extends StatelessWidget {
  final String hint;
  const CustomSearch({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    Color button = Theme.of(context).colorScheme.primary;
    Color container = Theme.of(context).colorScheme.onPrimary;
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: container, borderRadius: BorderRadius.circular(15)),
      child: TextField(
        decoration: InputDecoration(
            hintText: hint,
            suffixIcon: InkWell(
              onTap: (){},
              child: Container(
                height: 10,
                width: 80,
                decoration: BoxDecoration(
                    color: button, borderRadius: BorderRadius.circular(15)),
                child: const Center(
                    child: CustomText(
                        tittle: 'Search',
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        size: 16)),
              ),
            ),
            prefixIcon: const Icon(Icons.search_outlined),
            contentPadding: const EdgeInsets.all(12),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            border: InputBorder.none),
      ),
    );
  }
}
