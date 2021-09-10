import 'dart:html';

import 'package:hagerawi_app/auth/models/auth_model.dart';
import 'package:hagerawi_app/feed/models/feed_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthRepo {
  Future<AuthModel> authenticate(String username, String password) async {
    // print([username, password]);
    final result = await http.Client().post(
      Uri.parse("http://localhost:5000/auth/"),
      headers: {
        "content-type": "application/json",
        "Accept": "application/json",
        "Access-Control_Allow_Origin": "*"
      },
      body: jsonEncode(
        <String, String>{
          "username": username.toString(),
          "password": password.toString()
        },
      ),
    );

    if (result.statusCode == 200) {
      final user = json.decode(result.body);
      print("the user is $user");
      return AuthModel.fromJson(user);
    } else {
      throw Exception('failed to login');
    }
  }
}
