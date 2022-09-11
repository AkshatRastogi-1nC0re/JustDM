import 'package:JustDM/src/model/product1.dart';
import 'package:JustDM/src/view/screen/CartElements/longproductcard.dart';
import 'package:JustDM/src/view/screen/constants.dart';
import 'package:JustDM/src/view/screen/size_config.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  FocusNode focusNode = FocusNode();
  dynamic argumentData = Get.arguments;

  List<Product1> cartitems = [];
  double totalprice = 0.0;

  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    cartitems = argumentData[0];
    totalprice = argumentData[1];
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_NNbwJ9tmM0fbxj',
      'amount': 28200,
      'name': 'Shaiq',
      'description': 'Payment',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      // debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Fluttertoast.showToast(
    //     msg: "SUCCESS: " + response.paymentId, timeInSecForIos: 4);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Fluttertoast.showToast(
    //     msg: "ERROR: " + response.code.toString() + " - " + response.message,
    //     timeInSecForIos: 4);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Fluttertoast.showToast(
    //     msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIos: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
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
                  SizedBox(height: 20,),
                  ListView.builder(
                    shrinkWrap: true,
                      itemCount: 8,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return Column(
                          children: [
                            LongProductCard(title: "Paneer Wrap",productimgname: "wrap.png",price: r"45",width: 100,),
                            SizedBox(height: 20,),
                          ],
                        );
                      }
                  ),

                  SizedBox(height: 110,),
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${cartitems.length} Items",
                          style: TextStyle(fontSize: (12), color: Colors.white),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "\₹${totalprice}",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        openCheckout();
                      },
                      child: Row(
                        children: const [
                          Text(
                            "Payment",
                            style:
                                TextStyle(fontSize: (17), color: Colors.white),
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
    );
  }
}
