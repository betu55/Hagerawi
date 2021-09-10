import 'package:hagerawi_app/admin_feeds/admin_feeds_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hagerawi_app/pages/events_post.dart';
import 'package:flutter/material.dart';

class AdminFeedRepo {
 
 Future<AdminFeedsModel> addFeed (String title,String desc, String author, String detailed ) async {
   final result = await 
   http.post(
    Uri.parse('http://localhost:5000/feeds'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Accept": "application/json",
      "Access-Control_Allow_Origin": "*"
    },
    body: jsonEncode(<String, String>{
      'title': title.toString(),
      'desc':desc.toString(),
      'author':author.toString(),
      'detailed':detailed.toString()
    }),
  );

var response= jsonDecode(result.body);

  
if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return AdminFeedsModel.fromJson(
      response);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}}
   
      //print(feeds);

      

  // Future<FeedModel> getSingleFeed() {}

