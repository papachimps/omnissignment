import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/controllers/authController.dart';
import 'constants.dart';

class SignUpScreen extends StatelessWidget {
  static const String route = 'signup';
  final authController = Get.find<AuthController>();

  final check1 = false.obs;
  final check2 = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(kDefaultMargin),
        children: [
          FlutterLogo(
            size: kDefaultMargin2 * 6,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: kDefaultMargin,
              horizontal: kDefaultMargin / 4,
            ),
            child: Text('SignUp', style: kTitleTextStyle),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: kDefaultMargin,
              horizontal: kDefaultMargin / 4,
            ),
            child: Text('Full Name*', style: kSubTitleTextStyle),
          ),
          TextField(
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            decoration: kInputTextFieldDecoration.copyWith(
              hintText: 'Enter Your Name',
              // errorText: !isUserIdValid ? 'Conditions not fulfilled' : null,
            ),
            onChanged: (value) {
              authController.userName.value = value.trim();
            },
          ),
          SizedBox(height: kDefaultMargin/2),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: kDefaultMargin,
              horizontal: kDefaultMargin / 4,
            ),
            child: Text('Email*', style: kSubTitleTextStyle),
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: kInputTextFieldDecoration.copyWith(
              hintText: 'Enter Email',
              // errorText: !isUserIdValid ? 'Conditions not fulfilled' : null,
            ),
            onChanged: (value) {
              authController.userId.value = value.trim();
            },
          ),
          SizedBox(height: kDefaultMargin/2),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: kDefaultMargin,
              horizontal: kDefaultMargin / 4,
            ),
            child: Text('Password*', style: kSubTitleTextStyle),
          ),
          TextField(
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            obscureText: authController.isPasswordObscured.value,
            decoration: kInputTextFieldDecoration.copyWith(
              hintText: 'Enter Password',
              hintStyle: kHintTextStyle,
              // errorText: !isUserIdValid ? 'Conditions not fulfilled' : null,
            ),
            onChanged: (value) {
              authController.password.value = value.removeAllWhitespace;
            },
            onEditingComplete: authController.validateAndAttemptLogin,
          ),
          SizedBox(height: kDefaultMargin / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                () => Checkbox(
                  value: check1.value,
                  activeColor: kDarkBlueColor,
                  onChanged: (_) => check1.toggle(),
                ),
              ),
              Text(
                'Do you have a referral code?',
                style: kTextButtonTextStyle,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                () => Checkbox(
                  value: check2.value,
                  activeColor: kDarkBlueColor,
                  onChanged: (_) => check2.toggle(),
                ),
              ),
              Text(
                'I agree with the terms and conditions.',
                style: kTextButtonTextStyle,
              ),
            ],
          ),
          SizedBox(height: kDefaultMargin),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kDefaultMargin2)),
                color: kButtonColor,
                elevation: 0,
                highlightElevation: 2,
                onPressed: () {
                  authController.validateAndAttemptLogin();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: kDefaultMargin2,
                      vertical: kDefaultMargin2 / 2),
                  child: Text(
                    'SignUp',
                    style: kSubTitleTextStyle.copyWith(color: kWhiteBgColor),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: kDefaultMargin * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Don\'t have an account?',
                style: kTextButtonTextStyle.copyWith(color: kDefaultFontColor),
              ),
              TextButton(
                onPressed: authController.goToSignUp,
                child: Text(
                  'Sign Up',
                  style: kTextButtonTextStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
