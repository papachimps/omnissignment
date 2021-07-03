import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import '/views/homeScreen.dart';
import '/views/loginScreen.dart';
import '/views/signupScreen.dart';

class AuthController extends GetxController {
  RxString userId = ''.obs;
  RxString password = ''.obs;
  RxString userName = ''.obs;
  RxString mobileNumber = ''.obs;

  RxBool isPasswordObscured = true.obs;
  RxBool shouldRememberSession = false.obs;

  bool _isUserIdValid = false;
  bool _isPasswordValid = false;

  void goToSignUp() {
    Get.toNamed(SignUpScreen.route);
  }

  void validateAndAttemptLogin() {
    _validateUserId();
    _validatePassword();
    if (_isUserIdValid & _isPasswordValid)
      _attemptLogin();
    else
      showSnackBar(
        'Invalid Credentials',
        'Enter valid email address and password',
      );
  }

  static Future<void> logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('activeSession');
    Get.offAndToNamed(LoginScreen.route);
  }

  Future<void> _attemptLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var _keys = prefs.getKeys();
    if (_keys.contains(userId.value)) {
      if (prefs.getString(userId.value) == password.value) {
        //store session only when remember box is checked
        if (shouldRememberSession.isTrue)
          await prefs.setString('activeSession', userId.value);
        Get.offAndToNamed(HomeScreen.route);
      } else
        showSnackBar(
          'Incorrect Password',
          'Try Password@123    :-D',
        );
    } else
      showSnackBar(
        'Email does not exist',
        'Try user@email.com or user@gmail.com   ;)',
      );
  }

  void _validateUserId() {
    print(userId.value);
    if (userId.value.isEmail) _isUserIdValid = true;
  }

  void _validatePassword() {
    var _pass = password.value;
    if (hasValidPasswordStructure(_pass) & !hasRecurringNumber(_pass)) {
      print('valid password');
      _isPasswordValid = true;
    }
  }

}

//
void showSnackBar(String title, String message) {
  return Get.snackbar(
    title,
    message,
    duration: Duration(seconds: 3),
    isDismissible: true,
    snackPosition: SnackPosition.BOTTOM,
    margin: EdgeInsets.zero,
    forwardAnimationCurve: Curves.linear,
    reverseAnimationCurve: Curves.linear,
  );
}

bool hasValidPasswordStructure(String value) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = new RegExp(pattern);
  return regExp.hasMatch(value);
}

bool hasRecurringNumber(String value) {
  String pattern =
      r'1{2,}|2{2,}|3{2,}|4{2,}|5{2,}|6{2,}|7{2,}|8{2,}|9{2,}|0{2,}';
  print('has recurring numeric values');
  return value.contains(RegExp(pattern));
}
