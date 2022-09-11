import 'package:JustDM/src/view/screen/CartElements/longproductcard.dart';
import 'package:JustDM/src/view/screen/constants.dart';
import 'package:JustDM/src/view/screen/size_config.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class YourOrders extends StatefulWidget {
  const YourOrders({Key? key}) : super(key: key);

  @override
  _YourOrdersState createState() => _YourOrdersState();
}

class _YourOrdersState extends State<YourOrders> {
  FocusNode focusNode = FocusNode();



  @override
  int quantity=1;
  int totalprice=100;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height:MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
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
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Your Orders",
                  style: TextStyle(
                    fontSize: (18),
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20,), 
              LongProductCard(title: "Paneer Wrap",productimgname: "wrap.png",price: r"45",width: 100,),
              SizedBox(height: 20,),
              LongProductCard(title: "Paneer Wrap",productimgname: "wrap.png",price: r"45",width: 100,),
              SizedBox(height: 20,),
              LongProductCard(title: "Paneer Wrap",productimgname: "wrap.png",price: r"45",width: 100,),
              SizedBox(height: 20,),
              LongProductCard(title: "Paneer Wrap",productimgname: "wrap.png",price: r"45",width: 100,),
              SizedBox(height: 130,),
            ],
          ),
        ),
      ),
    );
  }
}
