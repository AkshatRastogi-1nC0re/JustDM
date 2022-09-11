import 'package:JustDM/src/model/bottom_navy_bar_item.dart';
import 'package:JustDM/src/model/product.dart';
import 'package:JustDM/src/model/product1.dart';
import 'package:JustDM/src/model/product_category.dart';
import 'package:JustDM/src/model/product_size_type.dart';
import 'package:JustDM/src/model/recommended_product.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../src/model/categorical.dart';
import '../src/model/numerical.dart';

class AppData {
  const AppData._();

  static List<Product1> products_maggi = [
    Product1(name: "Cafe Latte", price: 40.0, quantity: 0, images: [
      "https://firebasestorage.googleapis.com/v0/b/justdm-f54de.appspot.com/o/Maggi%20Hotspot%2FCaf%E2%80%9A_Latte-removebg-preview.webp?alt=media&token=1a965302-6a8f-4c7c-9e48-531992a234ca"
    ]),
    Product1(name: "Caoouccino", price: 50.0, quantity: 0, images: [
      "https://firebasestorage.googleapis.com/v0/b/justdm-f54de.appspot.com/o/Maggi%20Hotspot%2FCapuccino-removebg-preview.webp?alt=media&token=814164e1-e0e0-4657-a078-93a022f158a3"
    ]),
    Product1(name: "Espresso", price: 60.0, quantity: 0, images: [
      "https://firebasestorage.googleapis.com/v0/b/justdm-f54de.appspot.com/o/Maggi%20Hotspot%2FOregano_m-removebg-preview.webp?alt=media&token=a055c03b-ec05-406c-8177-3d5030605117"
    ]),
    Product1(name: "Special Maggi", price: 40.0, quantity: 0, images: [
      "https://firebasestorage.googleapis.com/v0/b/justdm-f54de.appspot.com/o/Maggi%20Hotspot%2Fatta_masala_m-removebg-preview.webp?alt=media&token=843786e7-6369-4541-90b5-912c76a1cec6"
    ]),
    Product1(name: "Chinese Maggi", price: 40.0, quantity: 0, images: [
      "https://firebasestorage.googleapis.com/v0/b/justdm-f54de.appspot.com/o/Maggi%20Hotspot%2Fbutter_double_masla_m-removebg-preview.webp?alt=media&token=765566ad-e716-453b-ac1a-fd5df6a1aa47"
    ]),
    Product1(name: "Cheeze Maggi", price: 42.0, quantity: 0, images: [
      "https://firebasestorage.googleapis.com/v0/b/justdm-f54de.appspot.com/o/Maggi%20Hotspot%2Fbutter_garlic_m-removebg-preview.webp?alt=media&token=0a93583f-85c5-4eb8-8280-18d25fd29ad6"
    ]),
    Product1(name: "Oregano Maggi", price: 40.0, quantity: 0, images: [
      "https://firebasestorage.googleapis.com/v0/b/justdm-f54de.appspot.com/o/Maggi%20Hotspot%2Fbutter_m-removebg-preview.webp?alt=media&token=cba0b28c-75bf-463e-ae8d-bb6cf50df8d2"
    ]),
    Product1(name: "Cafe Latte", price: 69.0, quantity: 0, images: [
      "https://firebasestorage.googleapis.com/v0/b/justdm-f54de.appspot.com/o/Maggi%20Hotspot%2FCaf%E2%80%9A_Latte-removebg-preview.webp?alt=media&token=1a965302-6a8f-4c7c-9e48-531992a234ca"
    ]),
    Product1(name: "Caoouccino", price: 50.0, quantity: 0, images: [
      "https://firebasestorage.googleapis.com/v0/b/justdm-f54de.appspot.com/o/Maggi%20Hotspot%2FCapuccino-removebg-preview.webp?alt=media&token=814164e1-e0e0-4657-a078-93a022f158a3"
    ]),
    Product1(name: "Espresso", price: 60.0, quantity: 0, images: [
      "https://firebasestorage.googleapis.com/v0/b/justdm-f54de.appspot.com/o/Maggi%20Hotspot%2FOregano_m-removebg-preview.webp?alt=media&token=a055c03b-ec05-406c-8177-3d5030605117"
    ]),
    Product1(name: "Special Maggi", price: 40.0, quantity: 0, images: [
      "https://firebasestorage.googleapis.com/v0/b/justdm-f54de.appspot.com/o/Maggi%20Hotspot%2Fatta_masala_m-removebg-preview.webp?alt=media&token=843786e7-6369-4541-90b5-912c76a1cec6"
    ]),
    Product1(name: "Halua Maggi", price: 55.0, quantity: 0, images: [
      "https://firebasestorage.googleapis.com/v0/b/justdm-f54de.appspot.com/o/Maggi%20Hotspot%2Fbutter_double_masla_m-removebg-preview.webp?alt=media&token=765566ad-e716-453b-ac1a-fd5df6a1aa47"
    ]),
    Product1(name: "Chinese Maggi", price: 40.0, quantity: 0, images: [
      "https://firebasestorage.googleapis.com/v0/b/justdm-f54de.appspot.com/o/Maggi%20Hotspot%2Fbutter_double_masla_m-removebg-preview.webp?alt=media&token=765566ad-e716-453b-ac1a-fd5df6a1aa47"
    ]),
    Product1(name: "Cheeze Maggi", price: 53.0, quantity: 0, images: [
      "https://firebasestorage.googleapis.com/v0/b/justdm-f54de.appspot.com/o/Maggi%20Hotspot%2Fbutter_garlic_m-removebg-preview.webp?alt=media&token=0a93583f-85c5-4eb8-8280-18d25fd29ad6"
    ]),
  ];

  static List<Product> products = [
    Product(
        name: 'Samsung Galaxy A53 5G',
        price: 460,
        about:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
        isAvailable: true,
        off: 300,
        quantity: 0,
        images: [
          'assets/images/a53_1.png',
          'assets/images/a53_2.png',
          'assets/images/a53_3.png'
        ],
        isLiked: true,
        rating: 1,
        type: ProductType.mobile),
    Product(
        name: 'Samsung Galaxy Tab S7 FE',
        price: 380,
        about:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
        isAvailable: false,
        off: 220,
        quantity: 0,
        images: [
          'assets/images/tab_s7_fe_1.png',
          'assets/images/tab_s7_fe_2.png',
          'assets/images/tab_s7_fe_3.png'
        ],
        isLiked: false,
        rating: 4,
        type: ProductType.tablet),
    Product(
        name: 'Samsung Galaxy Tab S8+',
        price: 650,
        about:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
        isAvailable: true,
        off: null,
        quantity: 0,
        images: [
          'assets/images/tab_s8_1.png',
          'assets/images/tab_s8_2.png',
          'assets/images/tab_s8_3.png',
        ],
        isLiked: false,
        rating: 3,
        type: ProductType.tablet),
    Product(
        name: 'Samsung Galaxy Watch 4',
        price: 229,
        about:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
        isAvailable: true,
        off: 200,
        quantity: 0,
        images: [
          'assets/images/galaxy_watch_4_1.png',
          'assets/images/galaxy_watch_4_2.png',
          'assets/images/galaxy_watch_4_3.png',
        ],
        isLiked: false,
        rating: 5,
        sizes: ProductSizeType(categorical: [
          Categorical(CategoricalType.small, true),
          Categorical(CategoricalType.medium, false),
          Categorical(CategoricalType.large, false),
        ]),
        type: ProductType.watch),
    Product(
        name: 'Apple Watch 7',
        price: 330,
        about:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
        isAvailable: true,
        off: null,
        quantity: 0,
        images: [
          'assets/images/apple_watch_series_7_1.png',
          'assets/images/apple_watch_series_7_2.png',
          'assets/images/apple_watch_series_7_3.png',
        ],
        isLiked: false,
        rating: 4,
        sizes: ProductSizeType(
            numerical: [Numerical('41', true), Numerical('45', false)]),
        type: ProductType.watch),
    Product(
        name: 'Beats studio 3',
        price: 230,
        about:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
        isAvailable: true,
        off: null,
        quantity: 0,
        images: [
          'assets/images/beats_studio_3-1.png',
          'assets/images/beats_studio_3-2.png',
          'assets/images/beats_studio_3-3.png',
          'assets/images/beats_studio_3-4.png',
        ],
        isLiked: false,
        rating: 2,
        type: ProductType.headphone),
    Product(
        name: 'Samsung Q60 A',
        price: 497,
        about:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
        isAvailable: true,
        off: null,
        quantity: 0,
        images: [
          'assets/images/samsung_q_60_a_1.png',
          'assets/images/samsung_q_60_a_2.png',
        ],
        isLiked: false,
        rating: 3,
        sizes: ProductSizeType(numerical: [
          Numerical('43', true),
          Numerical('50', false),
          Numerical('55', false)
        ]),
        type: ProductType.tv),
    Product(
        name: 'Sony x 80 J',
        price: 498,
        about:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
        isAvailable: true,
        off: null,
        quantity: 0,
        images: [
          'assets/images/sony_x_80_j_1.png',
          'assets/images/sony_x_80_j_2.png',
        ],
        isLiked: false,
        sizes: ProductSizeType(numerical: [
          Numerical('50', true),
          Numerical('65', false),
          Numerical('85', false)
        ]),
        rating: 2,
        type: ProductType.tv),
  ];

  static List<ProductCategory> categories = [
    ProductCategory(ProductType.all, true, Icons.all_inclusive),
    ProductCategory(
        ProductType.mobile, false, FontAwesomeIcons.mobileScreenButton),
    ProductCategory(ProductType.watch, false, Icons.watch),
    ProductCategory(ProductType.tablet, false, FontAwesomeIcons.tablet),
    ProductCategory(ProductType.headphone, false, Icons.headphones),
    ProductCategory(ProductType.tv, false, Icons.tv),
  ];

  static List<Color> randomColors = [
    const Color(0xFFFCE4EC),
    const Color(0xFFF3E5F5),
    const Color(0xFFEDE7F6),
    const Color(0xFFE3F2FD),
    const Color(0xFFE0F2F1),
    const Color(0xFFF1F8E9),
    const Color(0xFFFFF8E1),
    const Color(0xFFECEFF1),
  ];

  static List<BottomNavyBarItem> bottomNavyBarItems = [
    BottomNavyBarItem(
        "Home", const Icon(Icons.home), const Color(0xFFEC6813), Colors.grey),
    BottomNavyBarItem("Favorite", const Icon(Icons.favorite),
        const Color(0xFFEC6813), Colors.grey),
    BottomNavyBarItem("Cart", const Icon(Icons.shopping_cart),
        const Color(0xFFEC6813), Colors.grey),
    BottomNavyBarItem("Profile", const Icon(Icons.person),
        const Color(0xFFEC6813), Colors.grey),
  ];

  static List<RecommendedProduct> recommendedProducts = [
    RecommendedProduct(
        imagePath: "", cardBackgroundColor: const Color(0xFFEC6813)),
    RecommendedProduct(
        imagePath: "",
        cardBackgroundColor: const Color(0xFF3081E1),
        buttonBackgroundColor: const Color(0xFF9C46FF),
        buttonTextColor: Colors.white),
  ];
}
