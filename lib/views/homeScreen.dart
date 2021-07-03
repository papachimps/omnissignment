import 'package:flutter/material.dart';
import '/controllers/authController.dart';

class HomeScreen extends StatelessWidget {
  static const String route = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: AuthController.logOut,
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Text('Logged in'),
      ),
    );
  }
}
