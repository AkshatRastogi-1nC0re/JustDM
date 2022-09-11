import 'package:flutter/material.dart';

import '../constants.dart';

class LongProductCard extends StatefulWidget {
  const LongProductCard({
    this.width = 150,
    this.aspectRatio = 1.5,
    this.productimgname = "",
    this.title = "",
    this.price = "",
    this.isorderdone = false,
  });
  final double width, aspectRatio;
  final String productimgname;
  final String title;
  final String price;
  final bool isorderdone;

  @override
  _LongProductCardState createState() => _LongProductCardState();
}

class _LongProductCardState extends State<LongProductCard> {
  @override
  int quantity = 1;
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
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
                  "${widget.productimgname}",
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(fontSize: (12), color: Colors.black),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "\₹${widget.price}",
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
                              setState(() {});
                            },
                            child: Container(
                              height: (20),
                              width: (20),
                              child: Icon(
                                Icons.add,
                                size: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            quantity.toString(),
                            style:
                                TextStyle(fontSize: (12), color: Colors.black),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {
                              setState(() {});
                            },
                            child: Container(
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
                    : Text(
                        " X " + quantity.toString(),
                        style: TextStyle(fontSize: (12), color: Colors.black),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
