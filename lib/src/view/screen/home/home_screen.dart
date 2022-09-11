
import 'package:carousel_slider/carousel_slider.dart';
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
                  options: CarouselOptions(height: 200.0,viewportFraction: 1,),
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
                    mainAxisAlignment: MainAxisAlignment.center,
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
                )

              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              color: Colors.red,
              height: 100,
              width: MediaQuery.of(context).size.width,
            ),
          )
        ],
      ),
    );
  }
}
