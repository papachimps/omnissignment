import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '/views/constants.dart';
import 'utils/miscellaneous.dart';

import 'views/homeScreen.dart';
import 'views/loginScreen.dart';
import 'views/signupScreen.dart';

bool isSessionActive = false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  storeMockUserAuths();
  isSessionActive = await hasActiveSession();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Omnirio Assignment',
      theme: ThemeData(
        accentColor: kDarkBlueColor,
        splashColor: kDarkBlueColor,
        backgroundColor: kWhiteBgColor,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      initialRoute: isSessionActive ? HomeScreen.route : LoginScreen.route,
      routes: {
        LoginScreen.route: (context) => LoginScreen(),
        HomeScreen.route: (context) => HomeScreen(),
        SignUpScreen.route: (context) => SignUpScreen(),
      },
    );
  }
}
