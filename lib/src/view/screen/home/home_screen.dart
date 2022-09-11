
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';
import 'components/ProductCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FocusNode focusNode = FocusNode();
  int _index = 0;
  int quantity=1;
  int totalprice=100;
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
                  margin: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  height: 65,
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: TextField(
                      style: TextStyle(fontSize: 14),
                      focusNode: focusNode,
                      textInputAction: TextInputAction.search,
                      onChanged: (value) {

                      },
                      onSubmitted: (value) {

                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16),
                          // horizontal: getProportionateScreenHeight(20),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: "Search product",
                          hintStyle: TextStyle(
                            fontSize: getProportionateScreenHeight(14),
                          ),
                          prefixIcon: Icon(Icons.search,
                              size: (18))),
                    ),
                  ),
                ),
                CarouselSlider(

                  options: CarouselOptions(
                      autoPlay: true,
                    height: 200.0,viewportFraction: 1,
                    onPageChanged:(int i, carouselPageChangedReason) {
                      setState(() {
                        _index = i;
                      });
                    }
                  ),
                  items: ["maggihotspot.jpg","maggihotspot.jpg"].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            child: Image(
                              height:MediaQuery.of(context).size.height,
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
                    dotsCount: 2,
                    position: _index.toDouble(),
                    decorator: DotsDecorator(
                        size: const Size.square(5.0),
                        activeSize: const Size(18.0, 5.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        activeColor: kPrimaryColor),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Recently Launched",
                    style: TextStyle(
                      fontSize: (18),
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProductCard(title: "Paneer Wrap",productimgname: "wrap.png",price: r"45",aspectRatio: 0.69,width: 180,),
                      SizedBox(width: 20,),
                      Column(
                        children: [
                          ProductCard(title: "Paneer Wrap",productimgname: "wrap.png",price: r"45"),
                          SizedBox(height: 20,),
                          ProductCard(title: "Paneer Wrap",productimgname: "wrap.png",price: r"45"),

                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Image(
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage(
                    "assets/maggihotspot.jpg",
                  ),
                  fit: BoxFit.fill,
                ),
                SizedBox(height: 20,),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Most Liked",
                    style: TextStyle(
                      fontSize: (18),
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ProductCard(title: "Paneer Wrap",productimgname: "wrap.png",price: r"45",),
                          SizedBox(width: 20,),
                          ProductCard(title: "Paneer Wrap",productimgname: "wrap.png",price: r"45",),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ProductCard(title: "Paneer Wrap",productimgname: "wrap.png",price: r"45",),
                          SizedBox(width: 20,),
                          ProductCard(title: "Paneer Wrap",productimgname: "wrap.png",price: r"45",),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ProductCard(title: "Paneer Wrap",productimgname: "wrap.png",price: r"45",),
                          SizedBox(width: 20,),
                          ProductCard(title: "Paneer Wrap",productimgname: "wrap.png",price: r"45",),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Image(
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage(
                    "assets/maggihotspot.jpg",
                  ),
                  fit: BoxFit.fill,
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Must Order",
                    style: TextStyle(
                      fontSize: (18),
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ProductCard(title: "Paneer Wrap",productimgname: "wrap.png",price: r"45",),
                        SizedBox(width: 20,),
                        ProductCard(title: "Paneer Wrap",productimgname: "wrap.png",price: r"45",),
                        SizedBox(width: 20,),
                        ProductCard(title: "Paneer Wrap",productimgname: "wrap.png",price: r"45",),
                        SizedBox(width: 20,),
                        ProductCard(title: "Paneer Wrap",productimgname: "wrap.png",price: r"45",),
                        SizedBox(width: 20,),
                        ProductCard(title: "Paneer Wrap",productimgname: "wrap.png",price: r"45",),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 130,),


              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Color(0xffcb7c0c),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$quantity Item",
                        style: TextStyle(
                            fontSize: (12),
                            color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 5,),
                      Text(
                        "\₹$totalprice",
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
                      Text(
                        "View Cart",
                        style: TextStyle(
                            fontSize: (17),
                            color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Icon(Icons.arrow_right,size: 30,color: Colors.white,)
                    ],
                  ),

                ],
              ),

              height: 80,
              width: MediaQuery.of(context).size.width,
            ),
          )
        ],
      ),
    );
  }
}
