import 'package:JustDM/src/controller/product_controller.dart';
import 'package:JustDM/src/view/screen/cart.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../size_config.dart';
import 'components/ProductCard.dart';

final ProductController controller = Get.put(ProductController());

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  dynamic argumentData = Get.arguments;
  String storeCode = "";
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    storeCode = argumentData[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  height: 65,
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: TextField(
                      style: const TextStyle(fontSize: 14),
                      focusNode: focusNode,
                      textInputAction: TextInputAction.search,
                      onChanged: (value) {},
                      onSubmitted: (value) {},
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 16),
                        // horizontal: getProportionateScreenHeight(20),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: "Search product",
                        hintStyle: TextStyle(
                          fontSize: getProportionateScreenHeight(14),
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: (18),
                        ),
                      ),
                    ),
                  ),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    viewportFraction: 1,
                  ),
                  items: ["maggihotspot.jpg", "maggihotspot.jpg"].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          child: Image(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            image: AssetImage(
                              "assets/$i",
                            ),
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    "Recently Launched",
                    style: TextStyle(
                      fontSize: (18),
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const ProductCard(
                        title: "Paneer Wrap",
                        productimgname: "wrap.png",
                        price: r"45",
                        aspectRatio: 0.69,
                        width: 180,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: const [
                          ProductCard(
                              title: "Paneer Wrap",
                              productimgname: "wrap.png",
                              price: r"45"),
                          SizedBox(
                            height: 20,
                          ),
                          ProductCard(
                              title: "Paneer Wrap",
                              productimgname: "wrap.png",
                              price: r"45"),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image(
                  width: MediaQuery.of(context).size.width,
                  image: const AssetImage(
                    "assets/maggihotspot.jpg",
                  ),
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    "Most Liked",
                    style: TextStyle(
                      fontSize: (18),
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          ProductCard(
                            title: "Paneer Wrap",
                            productimgname: "wrap.png",
                            price: r"45",
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          ProductCard(
                            title: "Paneer Wrap",
                            productimgname: "wrap.png",
                            price: r"45",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          ProductCard(
                            title: "Paneer Wrap",
                            productimgname: "wrap.png",
                            price: r"45",
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          ProductCard(
                            title: "Paneer Wrap",
                            productimgname: "wrap.png",
                            price: r"45",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          ProductCard(
                            title: "Paneer Wrap",
                            productimgname: "wrap.png",
                            price: r"45",
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          ProductCard(
                            title: "Paneer Wrap",
                            productimgname: "wrap.png",
                            price: r"45",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Image(
                  width: MediaQuery.of(context).size.width,
                  image: const AssetImage(
                    "assets/maggihotspot.jpg",
                  ),
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    "Must Order",
                    style: TextStyle(
                      fontSize: (18),
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: const [
                        ProductCard(
                          title: "Paneer Wrap",
                          productimgname: "wrap.png",
                          price: r"45",
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ProductCard(
                          title: "Paneer Wrap",
                          productimgname: "wrap.png",
                          price: r"45",
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ProductCard(
                          title: "Paneer Wrap",
                          productimgname: "wrap.png",
                          price: r"45",
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ProductCard(
                          title: "Paneer Wrap",
                          productimgname: "wrap.png",
                          price: r"45",
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ProductCard(
                          title: "Paneer Wrap",
                          productimgname: "wrap.png",
                          price: r"45",
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 130,
                ),
              ],
            ),
          ),
          Obx(() {
            return Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                    color: Color(0xffcb7c0c),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${controller.cartProducts.length} Items",
                          style: const TextStyle(
                              fontSize: (12), color: Colors.white),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "\₹${controller.totalPrice.value}",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.offAll(const Cart(), arguments: [
                              controller.cartProducts,
                              controller.totalPrice.value
                            ]);
                          },
                          child: Text(
                            "View Cart",
                            style:
                                TextStyle(fontSize: (17), color: Colors.white),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(
                          Icons.arrow_right,
                          size: 30,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ],
                ),
                height: 80,
                width: MediaQuery.of(context).size.width,
              ),
            );
          })
        ],
      ),
    );
  }
}
