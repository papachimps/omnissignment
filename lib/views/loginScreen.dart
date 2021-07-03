import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/controllers/authController.dart';
import '/views/constants.dart';

class LoginScreen extends StatelessWidget {
  static const String route = 'login';
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(kDefaultMargin),
        children: [
          FlutterLogo(
            size: kDefaultMargin2 * 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: kDefaultMargin,
              horizontal: kDefaultMargin / 4,
            ),
            child: Text('Login', style: kTitleTextStyle),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: kDefaultMargin,
              horizontal: kDefaultMargin / 4,
            ),
            child: Text('Username or Email', style: kSubTitleTextStyle),
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: kInputTextFieldDecoration.copyWith(
              hintText: 'Enter Username or Email',
              // errorText: !isUserIdValid ? 'Conditions not fulfilled' : null,
            ),
            onChanged: (value) {
              authController.userId.value = value.removeAllWhitespace;
            },
          ),
          SizedBox(height: kDefaultMargin),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: kDefaultMargin,
              horizontal: kDefaultMargin / 4,
            ),
            child: Text('Password', style: kSubTitleTextStyle),
          ),
          Obx(
            () => TextField(
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              obscureText: authController.isPasswordObscured.value,
              decoration: kInputTextFieldDecoration.copyWith(
                  hintText: 'Enter Password',
                  hintStyle: kHintTextStyle,
                  suffixIcon: IconButton(
                    onPressed: () => authController.isPasswordObscured.toggle(),
                    splashRadius: kDefaultMargin2,
                    icon: Icon(
                      authController.isPasswordObscured.isTrue
                          ? Icons.visibility
                          : Icons.visibility_off_outlined,
                      color: kDarkBlueColor,
                      semanticLabel: 'Show/Hide Password',
                    ),
                  )
                  // errorText: !isUserIdValid ? 'Conditions not fulfilled' : null,
                  ),
              onChanged: (value) {
                authController.password.value = value.removeAllWhitespace;
              },
              onEditingComplete: authController.validateAndAttemptLogin,
            ),
          ),
          SizedBox(height: kDefaultMargin),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                () => Checkbox(
                  value: authController.shouldRememberSession.value,
                  activeColor: kDarkBlueColor,
                  onChanged: (_) =>
                      authController.shouldRememberSession.toggle(),
                ),
              ),
              Text(
                'Remember Me',
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
                    'Login',
                    style: kSubTitleTextStyle.copyWith(color: kWhiteBgColor),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password ?',
                  style: kTextButtonTextStyle,
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
