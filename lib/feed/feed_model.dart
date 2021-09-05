// this class describes what a single feed should contain within
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

class FeedModel {
  final imgUrl;
  final title;
  final desc;
  final detailed;
  final author;

  FeedModel(this.imgUrl, this.title, this.author, this.desc, this.detailed);

  factory FeedModel.fromJson(Map<String, dynamic> json) {
    return FeedModel(
      json[0],
      json[0],
      json[0],
      json[0],
      json[0],
    );
  }
}
