import 'package:fitflex_app/core/view_model/auth_view_model.dart';
import 'package:fitflex_app/view/widgets/custom_button.dart';
import 'package:fitflex_app/view/widgets/custom_button_social.dart';
import 'package:fitflex_app/view/widgets/custom_text.dart';
import 'package:fitflex_app/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'register_view.dart';

import '../../constants.dart';

class LoginView extends GetWidget<AuthViewModel> {
  LoginView({Key key}) : super(key: key);

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
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
                    top: 150, left: 18, right: 18, bottom: 150),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    CustomText(
                      text: 'FITFLEX',
                      fontsize: 60,
                      fontweight: FontWeight.bold,
                      color: kprimaryColor,
                      alignment: Alignment.center,
                    ),
                    SizedBox(height: 50),
                    CustomTextField(
                      icon: Icons.email,
                      keyboardtype: TextInputType.emailAddress,
                      hinttext: 'Email',
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
                      icon: Icons.lock,
                      ispassword: true,
                      hinttext: ' Password',
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
                      text: 'SIGN IN',
                      press: () {
                        _formkey.currentState.save();
                        if (_formkey.currentState.validate()) {
                          controller.signinWithEmailAndPasswrd();
                        }
                      },
                    ),
                    SizedBox(height: 40),
                    GestureDetector(
                      onTap: () {},
                      child: CustomText(
                        text: 'forget password ?',
                        fontsize: 14,
                        fontweight: FontWeight.bold,
                        alignment: Alignment.center,
                      ),
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
                          imagePath: 'images/facebook.png',
                        ),
                        SizedBox(width: 10),
                        CustomButtonSocial(
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
                        Get.offAll(RegisterView());
                      },
                      child: CustomText(
                        text: "Don't have an account? Sign up",
                        fontsize: 14,
                        fontweight: FontWeight.bold,
                        alignment: Alignment.center,
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
