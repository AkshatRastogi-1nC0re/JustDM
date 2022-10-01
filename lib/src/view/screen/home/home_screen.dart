import 'package:JustDM/src/controller/product_controller.dart';
import 'package:JustDM/src/model/product1.dart';
import 'package:JustDM/src/view/screen/cart.dart';
import 'package:JustDM/src/view/screen/storeselect.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../profile.dart';
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
  int _index = 0;
  List<Product1> productList = [];

  @override
  void initState() {
    storeCode = argumentData[0];
    productList = controller.selectProductList(storeCode);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.offAll(const StoreSelect());
        return Future.value(false);
      },
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width - 90,
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
                      GestureDetector(
                          onTap: () {
                            Get.offAll(const Profile());
                          },
                          child: SvgPicture.asset(
                            "assets/icons/User.svg",
                            color: kPrimaryColor,
                            width: 22,
                          ))
                    ],
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: true,
                        height: 300.0,
                        viewportFraction: 1,
                        onPageChanged: (int i, carouselPageChangedReason) {
                          setState(() {
                            _index = i;
                          });
                        }),
                    items: [
                      storeCode == "maggi-hotspot"
                          ? "maggihotspot1.jpeg"
                          : "selectstore/kathi1.jpeg",
                      storeCode == "maggi-hotspot"
                          ? "maggihotspot2.jpeg"
                          : "selectstore/kathi2.jpeg",
                      storeCode == "maggi-hotspot"
                          ? "maggihotspot4.jpg"
                          : "selectstore/kathi3.jpeg",
                    ].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return SizedBox(
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
                  Center(
                    child: DotsIndicator(
                      dotsCount: 3,
                      position: _index.toDouble(),
                      decorator: DotsDecorator(
                          size: const Size.square(5.0),
                          activeSize: const Size(18.0, 5.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          activeColor: kPrimaryColor),
                    ),
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
                        ProductCard(
                          title: productList[0].name.toString(),
                          productimgname: productList[0].images[0],
                          price: productList[0].price.toString(),
                          aspectRatio: 0.69,
                          width: 180,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            ProductCard(
                              title: productList[1].name.toString(),
                              productimgname: productList[1].images[0],
                              price: productList[1].price.toString(),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ProductCard(
                              title: productList[2].name.toString(),
                              productimgname: productList[2].images[0],
                              price: productList[2].price.toString(),
                            ),
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
                    image: AssetImage(
                      storeCode == "maggi-hotspot"
                          ? "assets/maggihotspot.jpg"
                          : "selectstore/kathi.jpeg",
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
                          children: [
                            ProductCard(
                              title: productList[3].name.toString(),
                              productimgname: productList[3].images[0],
                              price: productList[3].price.toString(),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ProductCard(
                              title: productList[4].name.toString(),
                              productimgname: productList[4].images[0],
                              price: productList[4].price.toString(),
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
                          children: [
                            ProductCard(
                              title: productList[5].name.toString(),
                              productimgname: productList[5].images[0],
                              price: productList[5].price.toString(),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ProductCard(
                              title: productList[6].name.toString(),
                              productimgname: productList[6].images[0],
                              price: productList[6].price.toString(),
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
                          children: [
                            ProductCard(
                              title: productList[7].name.toString(),
                              productimgname: productList[7].images[0],
                              price: productList[7].price.toString(),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ProductCard(
                              title: productList[8].name.toString(),
                              productimgname: productList[8].images[0],
                              price: productList[8].price.toString(),
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
                    image: AssetImage(
                      storeCode == "maggi-hotspot"
                          ? "assets/maggihotspot3.jpeg"
                          : "selectstore/kathi3.jpeg",
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
                        children: [
                          ProductCard(
                            title: productList[9].name.toString(),
                            productimgname: productList[9].images[0],
                            price: productList[9].price.toString(),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          ProductCard(
                            title: productList[10].name.toString(),
                            productimgname: productList[10].images[0],
                            price: productList[10].price.toString(),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          ProductCard(
                            title: productList[11].name.toString(),
                            productimgname: productList[11].images[0],
                            price: productList[11].price.toString(),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          ProductCard(
                            title: productList[12].name.toString(),
                            productimgname: productList[12].images[0],
                            price: productList[12].price.toString(),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          ProductCard(
                            title: productList[13].name.toString(),
                            productimgname: productList[13].images[0],
                            price: productList[13].price.toString(),
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
              int x = 0;
              for (int i = 0; i < controller.cartProducts.length; i++) {
                x = x + controller.cartProducts[i].quantity.toInt();
              }
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
                            "${x} Items",
                            style: const TextStyle(
                                fontSize: (12), color: Colors.white),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "₹${controller.totalPrice.value}",
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
                                controller.cartProducts.value,
                                controller.totalPrice.value
                              ]);
                            },
                            child: const Text(
                              "View Cart",
                              style: TextStyle(
                                  fontSize: (17), color: Colors.white),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Icon(
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
      ),
    );
  }
}
