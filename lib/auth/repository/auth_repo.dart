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

    var response = jsonDecode(result.body);

    if (response == null) {
      throw Exception("user doesn't exist");
    } else {
      return AuthModel.fromJson(response);
    }

    return AuthModel(username: "mike", password: "butchabel");
    // if (result.statusCode == 200) {
    //   print(result);
    //   final user = result.body;
    //   if (user == null) throw Exception("Hell no");
    //   else
    //     return AuthModel(user.username, user.password);
    // } else {
    //   throw Exception('failed to login');
    // }
  }
}
