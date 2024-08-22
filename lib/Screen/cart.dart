
import 'package:flutter/material.dart';

import 'package:practice/Custom_Widget/custom_text.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    Color background = Theme.of(context).colorScheme.surface;
    Color container = Theme.of(context).colorScheme.onPrimary;
    Color text = Theme.of(context).colorScheme.onSurface;
    Color button = Theme.of(context).colorScheme.primary;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: background,
        title: CustomText(
            tittle: 'Cart list',
            color: text,
            fontWeight: FontWeight.w500,
            size: 20),
        centerTitle: true,
      ),
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: container,
                ),
                child: Row(
                  children: [
                    Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/practice-85888.appspot.com/o/Product%2FShoe%2Fshoe1.png?alt=media&token=686f8dcc-a234-4f17-95e9-8aa87268f7b6',
                      height: 80,
                      width: 80,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            tittle: 'Nicks Shoe',
                            color: text,
                            fontWeight: FontWeight.w500,
                            size: 20),
                        CustomText(
                            tittle: '\$250',
                            color: text,
                            fontWeight: FontWeight.w500,
                            size: 18),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: background,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: button,
                            width: 1,
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.add,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          CustomText(
                              tittle: '1',
                              color: text,
                              fontWeight: FontWeight.w500,
                              size: 14),
                          const SizedBox(
                            width: 10,
                          ),
                          CustomText(
                              tittle: '-',
                              color: text,
                              fontWeight: FontWeight.w700,
                              size: 20),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: SizedBox(
          height: 100,
          child: Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        tittle: 'Total',
                        color: text,
                        fontWeight: FontWeight.w500,
                        size: 18),
                    CustomText(
                        tittle: '= \$250',
                        color: text,
                        fontWeight: FontWeight.w500,
                        size: 18),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: button, borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: CustomText(
                        tittle: 'Buy Now',
                        color: text,
                        fontWeight: FontWeight.w600,
                        size: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
