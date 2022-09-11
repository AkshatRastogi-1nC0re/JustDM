import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectStoreCard extends StatefulWidget {
  final double cardwidth;
  final double cardheight;
  final String imgname;
  final String title;
  final String desp;
  const SelectStoreCard({
    this.cardwidth = 280,
    this.cardheight = 350,
    this.imgname="",
    this.title="",
    this.desp="",
  });

  @override
  _SelectStoreCardState createState() => _SelectStoreCardState();
}

class _SelectStoreCardState extends State<SelectStoreCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white54,
      ),

      width: widget.cardwidth,
      height: widget.cardheight,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(200),
            ),
            child: Image(
              width: widget.cardwidth,
              height: widget.cardheight,
              image: AssetImage(
                "assets/${widget.imgname}",
              ),
              fit: BoxFit.cover,
            ),
          ),
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 8.0,
                sigmaY: 8.0,
              ),
              child: Container(
                color: Colors.black.withOpacity(0.2),
                height: widget.cardheight/3,
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        widget.title,
                        style: TextStyle(
                          color: Colors.white,
                            height: 1.3,
                            fontFamily: "Metrisch-Bold",
                            fontSize: 17)),
                    SizedBox(height: 3,),
                    Text(
                      widget.desp,
                      style: TextStyle(
                          fontFamily: "Montserrat-Extralight",
                          height: 1.5,
                          fontSize: 12,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
              bottom: 10,
              child: Icon(Icons.arrow_forward_sharp,color: Colors.black,size: 25,)
          )
        ],
      ),
    );
  }
}
