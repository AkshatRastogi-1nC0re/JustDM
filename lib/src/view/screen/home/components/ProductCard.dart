import 'package:flutter/material.dart';

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

class _ProductCardState extends State<ProductCard> {
  @override
  int quantity=1;
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
                  height:MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage(
                    "assets/${widget.productimgname}",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 5,),
            Text(
              widget.title,
              style: TextStyle(
                  fontSize: (12),
                  color: Colors.black),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5,),
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

                        });
                      },
                      child: Container(
                        height: (20),
                        width: (20),
                        child: Icon(Icons.add,size: 15,),
                      ),
                    ),
                    SizedBox(width: 8,),
                    Text(
                      quantity.toString(),
                      style: TextStyle(
                          fontSize: (12),
                          color: Colors.black),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(width: 8,),
                    InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        setState(() {

                        });
                      },

                      child: Container(
                        height: (20),
                        width: (20),
                        child: Icon(Icons.remove,size: 15,),
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
