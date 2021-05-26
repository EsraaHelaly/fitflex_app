import 'package:fitflex_app/core/view_model/auth_view_model.dart';
import 'package:fitflex_app/view/widgets/custom_button.dart';
import 'package:fitflex_app/view/widgets/custom_button_social.dart';
import 'package:fitflex_app/view/widgets/custom_text.dart';
import 'package:fitflex_app/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import 'login_view.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  RegisterView({Key key}) : super(key: key);

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Color(0xffEAEAEA),
                  Colors.grey.shade400,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 150, left: 20, right: 20, bottom: 100),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  CustomText(
                    text: 'FITFLEX',
                    fontsize: 60,
                    fontweight: FontWeight.bold,
                    color: kprimaryColor,
                    alignment: Alignment.center,
                  ),
                  SizedBox(height: 2),
                  CustomText(
                    text: 'Make yourself better and stronger',
                    fontsize: 17,
                    color: Color(0xff818181),
                    alignment: Alignment.center,
                  ),
                  SizedBox(height: 40),
                  CustomTextField(
                    keyboardtype: TextInputType.name,
                    hinttext: 'Name',
                    icon: Icons.person,
                    onsaved: (value) {
                      controller.name = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        print('error');
                      }
                    },
                  ),
                  SizedBox(height: 30),
                  CustomTextField(
                    keyboardtype: TextInputType.emailAddress,
                    hinttext: 'Email',
                    icon: Icons.email,
                    onsaved: (value) {
                      controller.email = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        print('error');
                      }
                    },
                  ),
                  SizedBox(height: 30),
                  CustomTextField(
                    keyboardtype: TextInputType.visiblePassword,
                    ispassword: true,
                    hinttext: 'Password',
                    icon: Icons.lock,
                    onsaved: (value) {
                      controller.password = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        print('error');
                      }
                    },
                  ),
                  SizedBox(height: 40),
                  CustomButton(
                    text: 'SIGN UP',
                    press: () {
                      _formkey.currentState.save();
                      if (_formkey.currentState.validate()) {
                        controller.createAccountWithEmailAndPasswrd();
                      }
                    },
                  ),
                  SizedBox(height: 30),
                  CustomText(
                    fontweight: FontWeight.bold,
                    text: "-OR-",
                    fontsize: 17,
                    alignment: Alignment.center,
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButtonSocial(
                        text: 'Sign In With FaceBook',
                        imagePath: 'images/facebook.png',
                      ),
                      SizedBox(height: 10),
                      CustomButtonSocial(
                        text: 'Sign In With Google',
                        imagePath: 'images/google.png',
                        press: () {
                          controller.googleSigninMethod();
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 46),
                  GestureDetector(
                    onTap: () {
                      Get.offAll(LoginView());
                    },
                    child: CustomText(
                      text: "Already user? Sign in",
                      fontsize: 14,
                      fontweight: FontWeight.bold,
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
