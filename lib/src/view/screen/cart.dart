import 'dart:convert';
import 'dart:io';

import 'package:JustDM/src/controller/cart_controller.dart';
import 'package:JustDM/src/model/product1.dart';
import 'package:JustDM/src/view/screen/CartElements/longproductcard.dart';
import 'package:JustDM/src/view/screen/constants.dart';
import 'package:JustDM/src/view/screen/size_config.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    });
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print(response);
    verifySignature(
      signature: response.signature,
      paymentId: response.paymentId,
      orderId: response.orderId,
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print(response);
    // Do something when payment fails
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(response.message ?? ''),
      ),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print(response);
    // Do something when an external wallet is selected
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(response.walletName ?? ''),
      ),
    );
  }

  // create order
  void createOrder() async {
    String username = razorCredentials.keyId;
    String password = razorCredentials.keySecret;
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    Map<String, dynamic> body = {
      "amount": 100,
      "currency": "INR",
      "receipt": "rcptid_11"
    };
    var res = await http.post(
      Uri.https(
          "api.razorpay.com", "v1/orders"), //https://api.razorpay.com/v1/orders
      headers: <String, String>{
        "Content-Type": "application/json",
        'authorization': basicAuth,
      },
      body: jsonEncode(body),
    );

    if (res.statusCode == 200) {
      openGateway(jsonDecode(res.body)['id']);
    }
    print(res.body);
  }

  openGateway(String orderId) {
    var options = {
      'key': razorCredentials.keyId,
      'amount': 100, //in the smallest currency sub-unit.
      'name': 'Acme Corp.',
      'order_id': orderId, // Generate order_id using Orders API
      'description': 'Fine T-Shirt',
      'timeout': 60 * 5, // in seconds // 5 minutes
      'prefill': {
        'contact': '9123456789',
        'email': 'ary@example.com',
      }
    };
    _razorpay.open(options);
  }

  verifySignature({
    String? signature,
    String? paymentId,
    String? orderId,
  }) async {
    Map<String, dynamic> body = {
      'razorpay_signature': signature,
      'razorpay_payment_id': paymentId,
      'razorpay_order_id': orderId,
    };

    var parts = [];
    body.forEach((key, value) {
      parts.add('${Uri.encodeQueryComponent(key)}='
          '${Uri.encodeQueryComponent(value)}');
    });
    var formData = parts.join('&');
    var res = await http.post(
      Uri.https(
        "10.0.2.2", // my ip address , localhost
        "razorpay_signature_verify.php",
      ),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded", // urlencoded
      },
      body: formData,
    );

    print(res.body);
    if (res.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(res.body),
        ),
      );
    }
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
                  SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: cartitems.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return Column(
                          children: [
                            LongProductCard(
                              title: cartitems[index].name,
                              productimgname: cartitems[index].images[0],
                              price: cartitems[index].price.toString(),
                              width: 100,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        );
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
                        createOrder();
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

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
