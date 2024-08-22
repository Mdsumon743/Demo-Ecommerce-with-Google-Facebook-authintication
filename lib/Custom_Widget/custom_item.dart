import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/Custom_Widget/custom_text.dart';
import 'package:practice/Screen/cart.dart';
import 'package:practice/Screen/product_details.dart';

class CustomItem extends StatelessWidget {
  final String image;
  final String price;
  final String tittle;
  final String star;
  final String review;
  final  String sold;

  const CustomItem({super.key, required this.image, required this.tittle, required this.price, required this.star, required this.review, required this.sold});

  @override
  Widget build(BuildContext context) {
    Color container = Theme.of(context).colorScheme.onPrimary;
    Color text = Theme.of(context).colorScheme.onSurface;
    Color button = Theme.of(context).colorScheme.primary;
    return InkWell(
      onTap: () {
        Get.to(
            curve: Curves.bounceIn,
            ProductDetails(
              star: star,
              price: price,
              review:review ,
              sold: sold,
              tittle: tittle,
              image: image,
            ));
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: container, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image.network(
                  image,
                height: 130,
                fit: BoxFit.fill,
                ),
                Image.asset(
                  'assets/images/heart.png',
                  height: 20,
                  width: 20,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        tittle: tittle,
                        textOverflow: TextOverflow.ellipsis,
                        maxline: 1,
                        color: text,
                        fontWeight: FontWeight.w500,
                        size: 14),
                    CustomText(
                        tittle: price,
                        color: text,
                        fontWeight: FontWeight.w500,
                        size: 12),
                     Row(
                      children: [
                         const Icon(Icons.star,color: Colors.orange,size: 15,),
                        CustomText(tittle: star, color: text, fontWeight: FontWeight.w400, size: 12)
                      ],
                    )
                  ],
                ),
              const   SizedBox(
                  width: 5,
                ),
                InkWell(
                    onTap: () {
                      Get.to(const CartPage());
                    },
                    child: Icon(
                      Icons.add_shopping_cart,
                      color: button,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SizeItem extends StatelessWidget {
  final String tittle;
  const SizeItem({super.key, required this.tittle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.onPrimary,
        border: Border.all(
            color: Theme.of(context).colorScheme.onSurface, width: 1),
      ),
      child: Center(
        child: CustomText(
            tittle: tittle,
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w400,
            size: 12),
      ),
    );
  }
}

class Itemcolor extends StatelessWidget {
  final Color color;
  final IconData? icon;
  const Itemcolor({super.key, required this.color, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Icon(icon),
    );
  }
}
