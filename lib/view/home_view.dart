import 'package:fitflex_app/core/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              resizeToAvoidBottomInset: false,
              body: Container(
                padding: EdgeInsets.only(top: 100, left: 20, right: 20),
              ),
            ),
    );
  }
}
