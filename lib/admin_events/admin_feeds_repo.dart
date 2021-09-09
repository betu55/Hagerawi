import 'package:hagerawi_app/admin_feeds/admin_feeds_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hagerawi_app/pages/events_post.dart';
import 'package:flutter/material.dart';

class AdminFeedRepo {
  // get fututr for getting list of feeds

  /* Future<AdminFeedsModel> addFeed(UpdatePost newPost) async {
    final List<UpdatePost> localPostList = List.empty(growable: true);

    await Future.delayed(Duration(milliseconds: 100));
    UpdatePost addedPost = newPost.copyWith();
    localPostList.add(addedPost);
    return addedPost;
  } */

  /* Future<AdminFeedsModel> addFeed(UpdatePost newPost) async {
    //declare from where we will be getting our list of objects
    final response = await http.post()
        .post("http://localhost:5000/admin_feeds",
        body: jsonEncode({

        })); */
         
 Future<AdminFeedsModel> addFeed (String num) async {
   final response = await 
   http.post(
    Uri.parse('http://localhost:5000/admin_feeds'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': TitleController.text,
      'desc':DescController.text,
      'author':AuthorController.text,
      'detailed':DetailedTextController.text
    }),
  );

  
if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return AdminFeedsModel.fromJson(
      jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}}
   
      //print(feeds);

      

  // Future<FeedModel> getSingleFeed() {}

