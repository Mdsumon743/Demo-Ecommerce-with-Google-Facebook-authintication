import 'package:flutter/material.dart';
import 'package:practice/Custom_Widget/custom_item.dart';
import 'package:practice/Custom_Widget/custom_text.dart';

class ProductDetails extends StatelessWidget {
  final String tittle;
  final String image;
  final String price;
  final String star;
  final String sold;
  final String review;
  const ProductDetails(
      {super.key,
      required this.tittle,
      required this.image,
      required this.price,
      required this.star,
      required this.sold,
      required this.review});

  @override
  Widget build(BuildContext context) {
    Color background = Theme.of(context).colorScheme.surface;
    Color container = Theme.of(context).colorScheme.onPrimary;
    Color text = Theme.of(context).colorScheme.onSurface;
    Color button = Theme.of(context).colorScheme.primary;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        title: CustomText(
            tittle: tittle, color: text, fontWeight: FontWeight.w500, size: 18),
      ),
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: container, borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Center(
                      child: Image.network(
                        image,
                        height: 250,
                        width: 200,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      tittle: tittle,
                      color: text,
                      fontWeight: FontWeight.w500,
                      size: 20),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/heart.png',
                        height: 25,
                        width: 25,
                      ))
                ],
              ),
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.all(3),
                      color: container,
                      child: CustomText(
                          tittle: '$sold sold',
                          color: text,
                          fontWeight: FontWeight.w400,
                          size: 16)),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.star,
                  ),
                  CustomText(
                      tittle: star,
                      color: text,
                      fontWeight: FontWeight.w500,
                      size: 14),
                  const SizedBox(
                    width: 5,
                  ),
                  CustomText(
                      tittle: '($review reviews)',
                      color: text,
                      fontWeight: FontWeight.w500,
                      size: 14),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomText(
                  tittle: 'Description',
                  color: text,
                  fontWeight: FontWeight.w600,
                  size: 20),
              const SizedBox(
                height: 5,
              ),
              CustomText(
                  tittle:
                      ' This is very good shoe nicks by created ultra color used  for this very imagine and highly customized shoe ever highly design material',
                  color: text.withOpacity(0.8),
                  fontWeight: FontWeight.w400,
                  size: 16),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizeItem(tittle: '23'),
                      SizedBox(
                        width: 3,
                      ),
                      SizeItem(tittle: '32'),
                      SizedBox(
                        width: 3,
                      ),
                      SizeItem(tittle: '26'),
                      SizedBox(
                        width: 3,
                      ),
                      SizeItem(tittle: '20'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Itemcolor(color: Colors.green),
                      SizedBox(
                        width: 3,
                      ),
                      Itemcolor(
                        color: Colors.red,
                        icon: Icons.done,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Itemcolor(color: Colors.blueAccent),
                      SizedBox(
                        width: 3,
                      ),
                      Itemcolor(color: Colors.purple),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: 65,
          child: Expanded(
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: button, borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: CustomText(
                        tittle: price,
                        color: text,
                        fontWeight: FontWeight.w600,
                        size: 18),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: button, borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: CustomText(
                          tittle: 'Add to cart',
                          color: text,
                          fontWeight: FontWeight.w600,
                          size: 18),
                    ),
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
