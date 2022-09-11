import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeScreenController extends GetxController {
  RxInt currentPage = 0.obs;
  List<String> storeNames = [
    "Maggi Hotspot",
    "Kathi Junction",
    "Chai Ok",
    "Quench",
    "Tuck Shop"
  ];

  List<String> storeCodes = [
    "maggi-hotspot",
    "kathi-junction",
    "chai-ok",
    "quench",
    "tuck-shop"
  ];

  void changePage(int index) {
    currentPage.value = index;
    update();
  }

  String getCurrentStoreName() {
    return storeNames[currentPage.value];
  }

  String getCurrentStoreCode() {
    return storeCodes[currentPage.value];
  }
}
