import 'package:fitflex_app/core/view_model/profile_view_model.dart';
import 'package:fitflex_app/view/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/custom_text.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: Container(
                padding: EdgeInsets.only(top: 120),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                          image: DecorationImage(
                            image: controller.userModel == null
                                ? AssetImage('images/pic.jpg')
                                : controller.userModel.pic == 'default'
                                    ? AssetImage('images/pic.jpg')
                                    : NetworkImage(controller.userModel.pic),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      CustomText(
                        text: controller.userModel.name,
                        fontsize: 20,
                        color: Colors.black,
                        alignment: Alignment.center,
                      ),
                      SizedBox(height: 100),
                      Container(
                        padding: EdgeInsets.only(top: 350, left: 120),
                        child: GestureDetector(
                          onTap: () {
                            controller.signOut();
                            Get.offAll(LoginView());
                          },
                          child: ListTile(
                            leading: Icon(Icons.logout),
                            title: CustomText(
                              text: 'SignOut',
                              fontsize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
