import 'package:JustDM/src/controller/product_controller.dart';
import 'package:JustDM/src/model/product.dart';
import 'package:JustDM/src/model/product1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    this.width = 150,
    this.aspectRatio = 1.5,
    this.productimgname = "",
    this.title = "",
    this.price = "",
  });
  final double width, aspectRatio;
  final String productimgname;
  final String title;
  final String price;

  @override
  _ProductCardState createState() => _ProductCardState();
}

final ProductController controller = Get.put(ProductController());

class _ProductCardState extends State<ProductCard> {
  @override
  int quantity = 0;
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  "${widget.productimgname}",
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.title,
            style: const TextStyle(fontSize: (12), color: Colors.black),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\₹${widget.price}",
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      setState(() {
                        quantity++;
                      });
                      controller.addToCart(new Product1(
                          name: widget.title,
                          price: double.parse(widget.price),
                          quantity: quantity,
                          images: [widget.productimgname]));
                    },
                    child: Container(
                      height: (20),
                      width: (20),
                      child: const Icon(
                        Icons.add,
                        size: 15,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    quantity.toString(),
                    style: const TextStyle(fontSize: (12), color: Colors.black),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      setState(() {
                        if (quantity > 0) {
                          quantity--;
                        }
                      });
                    },
                    child: Container(
                      height: (20),
                      width: (20),
                      child: const Icon(
                        Icons.remove,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
