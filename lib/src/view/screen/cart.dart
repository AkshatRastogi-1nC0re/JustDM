import 'dart:convert';
import 'dart:io';

import 'package:JustDM/src/controller/cart_controller.dart';
import 'package:JustDM/src/model/product1.dart';
import 'package:JustDM/src/view/screen/CartElements/longproductcard.dart';
import 'package:JustDM/src/view/screen/constants.dart';
import 'package:JustDM/src/view/screen/home/home_screen.dart';
import 'package:JustDM/src/view/screen/payments.dart';
import 'package:JustDM/src/view/screen/size_config.dart';
import 'package:JustDM/src/view/screen/storeselect.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;
import 'razor_credentials.dart' as razorCredentials;

final CartController controller = Get.put(CartController());

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  FocusNode focusNode = FocusNode();
  dynamic argumentData = Get.arguments;
  final _razorpay = Razorpay();

  List<Product1> cartitems = [];
  double totalprice = 0.0;

  @override
  void initState() {
    super.initState();
    cartitems = argumentData[0];
    totalprice = argumentData[1];
    controller.cartProducts.value = cartitems;
    controller.totalPrice.value = totalprice;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.offAll(const StoreSelect());
        return Future.value(false);
      },
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
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
                              prefixIcon: const Icon(Icons.search, size: (18))),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.cartProducts.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return Column(
                              children: [
                                LongProductCard(
                                  title: controller.cartProducts[index].name,
                                  productimgname:
                                      controller.cartProducts[index].images[0],
                                  price: controller.cartProducts[index].price
                                      .toString(),
                                  quantity:
                                      controller.cartProducts[index].quantity,
                                  width: 100,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            );
                          });
                    }),
                    const SizedBox(
                      height: 110,
                    ),
                  ],
                ),
              ),
              Positioned(
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
                      Obx(() {
                        return Column(
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
                              "₹${controller.totalPrice.value}",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            )
                          ],
                        );
                      }),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => Webpayment(
                          //               price:
                          //                   controller.totalPrice.value * 100,
                          //             )));
                          // createOrder();
                        },
                        child: Row(
                          children: const [
                            Text(
                              "Payment",
                              style: TextStyle(
                                  fontSize: (17), color: Colors.white),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Icon(
                              Icons.arrow_right,
                              size: 30,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
