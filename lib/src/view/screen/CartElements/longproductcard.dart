import 'package:JustDM/src/controller/cart_controller.dart';
import 'package:JustDM/src/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class LongProductCard extends StatefulWidget {
  const LongProductCard({
    this.width = 150,
    this.aspectRatio = 1.5,
    this.productimgname = "",
    this.quantity = 0,
    this.title = "",
    this.price = "",
    this.isorderdone = false,
  });
  final double width, aspectRatio;
  final int quantity;
  final String productimgname;
  final String title;
  final String price;
  final bool isorderdone;

  @override
  _LongProductCardState createState() => _LongProductCardState();
}

final CartController controller = Get.put(CartController());

class _LongProductCardState extends State<LongProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 100,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: widget.aspectRatio,
            child: Container(
              decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                image: NetworkImage(
                  widget.productimgname,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                            fontSize: (12), color: Colors.black),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "₹${widget.price}",
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                widget.isorderdone == false
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {
                              int index = controller.cartProducts.indexWhere(
                                  (element) => element.name == widget.title);
                              controller.updateCart(index,
                                  controller.cartProducts[index].quantity + 1);
                              setState(() {});
                            },
                            child: const SizedBox(
                              height: (20),
                              width: (20),
                              child: Icon(
                                Icons.add,
                                size: 15,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Obx(() {
                            return Text(
                              controller.cartProducts
                                  .where(
                                      (element) => element.name == widget.title)
                                  .first
                                  .quantity
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: (12), color: Colors.black),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            );
                          }),
                          const SizedBox(
                            width: 8,
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {
                              int index = controller.cartProducts.indexWhere(
                                  (element) => element.name == widget.title);
                              var x =
                                  controller.cartProducts[index].quantity - 1;
                              if (x == 0) {
                                controller.removeFromCart(index);
                              } else {
                                controller.updateCart(index, x);
                              }
                              setState(() {});
                            },
                            child: const SizedBox(
                              height: (20),
                              width: (20),
                              child: Icon(
                                Icons.remove,
                                size: 15,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Obx(() {
                        return Text(
                          " X " +
                              controller.cartProducts
                                  .where(
                                      (element) => element.name == widget.title)
                                  .first
                                  .quantity
                                  .toString(),
                          style: const TextStyle(
                              fontSize: (12), color: Colors.black),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        );
                      })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
