import 'dart:convert';

class User {
  final String userId;
  final String password;

  User(this.userId, this.password);

  User.fromJson(Map<String, dynamic> json)
      : userId = json["usernameOrEmail"],
        password = json["password"];

  Map<String, dynamic> toJson() => {
        'usernameOrEmail': userId,
        'password': password,
      };
}

//example
User user = User('user@email.com', 'Password@123');

/// serializing [user] object to [jsonString]
String jsonString = jsonEncode(user.toJson());

/// deSerializing [jsonString] object to [userObject]
User userObject = User.fromJson(jsonDecode(jsonString));
