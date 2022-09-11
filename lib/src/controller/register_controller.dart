import 'dart:math';

import 'package:JustDM/core/extensions.dart';
import 'package:JustDM/src/services/user_services.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../core/app_data.dart';
import '../model/numerical.dart';

class RegisterController extends GetxController {
  RxBool loading = false.obs;
  final UserServices _services = UserServices();

  String generateId() {
    // Add random 5 alphanumerics at end of id
    return DateTime.now().millisecondsSinceEpoch.toString() +
        (10000 + Random().nextInt(90000)).toString();
  }

  registerUserUsingUserServices(data) {
    String id = generateId();
    data["id"] = id;
    _services.createUserData(data);
  }
}
