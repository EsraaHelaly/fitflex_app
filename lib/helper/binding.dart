import 'package:fitflex_app/core/view_model/auth_view_model.dart';
import 'package:fitflex_app/core/view_model/home_view_model.dart';
import 'package:fitflex_app/core/view_model/nav_bar_view_model.dart';
import 'package:fitflex_app/core/view_model/profile_view_model.dart';
import 'package:get/get.dart';

import 'local_storage.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => NavBarHomeViewModel());
    Get.lazyPut(() => LocalStorage());
    Get.lazyPut(() => ProfileViewModel());
    Get.lazyPut(() => HomeViewModel());
  }
}
