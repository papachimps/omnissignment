import 'package:shared_preferences/shared_preferences.dart';

Future<void> storeMockUserAuths() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // prefs.clear();
  var _keys = prefs.getKeys();
  if (!_keys.contains('user@gmail.com')) {
    await prefs.setString('user@gmail.com', "Password@123");
    print('added user-pass 1');
  }
  if (!_keys.contains('user@email.com')) {
    await prefs.setString('user@email.com', "Password@123");
    print('added usermail-pass 2');
  }
  print('keys: ${prefs.getKeys()}');
}

Future<bool> hasActiveSession() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getKeys().contains('activeSession');
}

//####################################
// import 'dart:convert'; // for the utf8.encode method
// import 'package:crypto/crypto.dart';

// String _password;
// String _salt = "omnirio";

// Digest encodePassword(String password) {
//   var bytes = utf8.encode(password); // data being hashed
//   var digest = sha1.convert(bytes);
//   return digest;
// }

// void _decodePassword(Digest crypticPass) {
//   _password = utf8.decode(crypticPass.bytes);
// }

//####################################
// String randomImageUrl() {
//   return 'https://picsum.photos/600?random=' +
//       Random().nextInt(10).toString();
// }
