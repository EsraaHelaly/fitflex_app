import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitflex_app/core/services/firestore_user.dart';
import 'package:fitflex_app/helper/local_storage.dart';
import 'package:fitflex_app/model/user_model.dart';
import 'package:fitflex_app/view/control_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignin = GoogleSignIn(scopes: ['email']);
  final LocalStorage localStorage = Get.find();
  FirebaseAuth _auth = FirebaseAuth.instance;

  String email, password, name;

  Rx<User> _user = Rx<User>();
  String get user => _user.value?.email;
  @override
  void onInit() {
    super.onInit();
    if (_auth.currentUser != null) {
      getCurrentUserData(_auth.currentUser.uid);
    }
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void googleSigninMethod() async {
    final GoogleSignInAccount _googleUser = await _googleSignin.signIn();

    GoogleSignInAuthentication _googleSigninAuth =
        await _googleUser.authentication;
    final AuthCredential _credential = GoogleAuthProvider.credential(
      idToken: _googleSigninAuth.idToken,
      accessToken: _googleSigninAuth.accessToken,
    );

    await _auth.signInWithCredential(_credential).then((user) {
      saveUser(user);
      Get.offAll(ControlView());
    });
  }

  void signinWithEmailAndPasswrd() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async => getCurrentUserData(value.user.uid));

      Get.offAll(ControlView());
    } catch (e) {
      print(e.message);

      Get.snackbar(
        'error login account',
        e.message,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void createAccountWithEmailAndPasswrd() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) {
        saveUser(user);
      });
      Get.offAll(ControlView());
    } catch (e) {
      print(e.message);

      Get.snackbar(
        'error login account',
        e.message,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user.uid,
      email: user.user.email,
      name: name == null ? user.user.displayName : name,
      pic: "",
    );
    await FirestoreUser().addUserToFirestore(userModel);
    setUser(userModel);
  }

  void setUser(UserModel userModel) async {
    await localStorage.setUser(userModel);
  }

  void getCurrentUserData(String uid) async {
    await FirestoreUser()
        .getCurrentUser(uid)
        .then((value) => setUser(UserModel.fromJson(value.data())));
  }
}
