import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/Custom_Widget/custom_item.dart';
import 'package:practice/Custom_Widget/custom_text.dart';
import 'package:practice/Custom_Widget/drawer.dart';
import 'package:practice/Custom_Widget/item_catagory.dart';
import 'package:practice/Custom_Widget/search.dart';
import 'package:practice/Screen/cart.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    Color background = Theme.of(context).colorScheme.surface;
    Color container = Theme.of(context).colorScheme.onPrimary;
    Color text = Theme.of(context).colorScheme.onSurface;
    Color button = Theme.of(context).colorScheme.primary;
    final GlobalKey<ScaffoldState> openkey = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        scrolledUnderElevation: 0,
        leading: InkWell(
          onTap: () {
            openkey.currentState!.openDrawer();
          },
          child: Container(
            margin: const EdgeInsets.all(7),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: container, shape: BoxShape.circle),
            child: Image.asset('assets/images/menu.png'),
          ),
        ),
        title: Row(
          children: [
            CustomText(
                tittle: 'HINT',
                color: button,
                fontWeight: FontWeight.w700,
                size: 20),
            CustomText(
                tittle: 'LY',
                color: text,
                fontWeight: FontWeight.w700,
                size: 20),
          ],
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Get.to(const CartPage(), curve: Curves.bounceInOut);
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(10),
              decoration:
                  BoxDecoration(color: container, shape: BoxShape.circle),
              child: Stack(alignment: Alignment.topRight, children: [
                Image.asset(
                  'assets/images/shopping-bag.png',
                  color: text,
                ),
                Container(
                  height: 5,
                  width: 5,
                  decoration:
                      BoxDecoration(color: button, shape: BoxShape.circle),
                )
              ]),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
                color: container,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: FirebaseAuth.instance.currentUser != null
                      ? NetworkImage(FirebaseAuth.instance.currentUser!.photoURL
                          .toString())
                      : const AssetImage(''),
                )),
          ),
        ],
      ),
      key: openkey,
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomSearch(
                hint: 'Search',
              ),
              const SizedBox(
                height: 5,
              ),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('banner')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    return CarouselSlider.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index, realIndex) {
                          final dataBanner = snapshot.data!.docs[index];
                          return Stack(children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: button,
                                  image: DecorationImage(
                                      image: NetworkImage(dataBanner['banner']),
                                      fit: BoxFit.cover)),
                            ),
                          ]);
                        },
                        options: CarouselOptions(
                          autoPlay: true,
                          height: 150,
                          aspectRatio: 16 / 9,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 900),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          reverse: false,
                          scrollDirection: Axis.horizontal,
                        ));
                  }),
              const SizedBox(
                height: 5,
              ),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('category')
                      .snapshots(),
                  builder: (_, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else {
                      return SizedBox(
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final dataCategory = snapshot.data!.docs[index];
                            return CustomItemCatagory(
                                image: dataCategory['icon'],
                                tittle: dataCategory['tittle']);
                          },
                        ),
                      );
                    }
                  }),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      tittle: 'Popular Shoe',
                      color: text,
                      fontWeight: FontWeight.w600,
                      size: 20),
                  CustomText(
                      tittle: 'view more',
                      color: text,
                      fontWeight: FontWeight.w400,
                      size: 14),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('shoe_product')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    return SizedBox(
                      height: 230,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.docs.length,
                        padding: const EdgeInsets.all(5),
                        itemBuilder: (context, index) {
                          final productData = snapshot.data!.docs[index];
                          return CustomItem(
                            sold: productData['sold'],
                            review: productData['review'],
                            price: productData['price'],
                              star: productData['star'],
                              image: productData['image'],
                              tittle: productData['name']);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                         return const SizedBox(
                            width: 5,
                          );


                        },
                      ),
                    );
                  }),
              const SizedBox(
                height: 5,
              ),
           
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      tittle: 'Popular Shirt',
                      color: text,
                      fontWeight: FontWeight.w600,
                      size: 20),
                  CustomText(
                      tittle: 'view more',
                      color: text,
                      fontWeight: FontWeight.w400,
                      size: 14),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('shirt_product')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    return SizedBox(
                      height: 230,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.docs.length,
                        padding: const EdgeInsets.all(5),
                        itemBuilder: (context, index) {
                          final productData = snapshot.data!.docs[index];
                          return CustomItem(
                              sold: productData['sold'],
                              review: productData['review'],
                              price: productData['price'],
                              star: productData['star'],
                              image: productData['image'],
                              tittle: productData['name']);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 5,
                          );


                        },
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
      drawer: const CustomDrawer(),
    );
  }
}
