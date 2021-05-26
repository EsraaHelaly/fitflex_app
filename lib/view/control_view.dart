import 'package:fitflex_app/constants.dart';
import 'package:fitflex_app/core/view_model/auth_view_model.dart';
import 'package:fitflex_app/core/view_model/nav_bar_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth/login_view.dart';

class ControlView extends GetWidget<AuthViewModel> {
  const ControlView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginView()
          : GetBuilder<NavBarHomeViewModel>(
              init: NavBarHomeViewModel(),
              builder: (controller) => Scaffold(
                resizeToAvoidBottomInset: false,
                body: controller.currentView,
                bottomNavigationBar: bottomNavBar(),
              ),
            );
    });
  }

  Widget bottomNavBar() {
    return GetBuilder<NavBarHomeViewModel>(
      init: NavBarHomeViewModel(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Results',
            icon: Icon(Icons.bar_chart),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person),
          ),
        ],
        currentIndex: controller.navValue,
        onTap: (index) => controller.changevalue(index),
        elevation: 0.0,
        selectedItemColor: kprimaryColor,
        backgroundColor: Colors.grey.shade200,
      ),
    );
  }
}
