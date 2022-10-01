import 'package:JustDM/core/app_data.dart';
import 'package:JustDM/src/model/product1.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProfileController extends GetxController {
  RxInt currentPage = 0.obs;
  List<String> storeNames = [
    "Maggi Hotspot",
    "Kathi Junction",
    "Chai Ok",
    "Quench",
    "Tuck Shop"
  ];

  List<Product1> selectProductList(code) {
    if (code == "maggi-hotspot") {
      return AppData.products_maggi;
    } else if (code == "kathi-junction") {
      return AppData.products_maggi;
    } else if (code == "chai-ok") {
      return AppData.products_maggi;
    } else if (code == "quench") {
      return AppData.products_maggi;
    } else {
      return AppData.products_maggi;
    }
  }

  List<String> storeCodes = [
    "maggi-hotspot",
    "kathi-junction",
    "chai-ok",
    "quench",
    "tuck-shop"
  ];
}
