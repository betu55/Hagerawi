import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

class ProgramModel {
  final title;
  final content;
  final location;
  final attendees;
  final postedby;

  ProgramModel(
      {this.title, this.content, this.location, this.attendees, this.postedby});

  factory ProgramModel.fromJson(Map<String, dynamic> json) {
    return ProgramModel(
        title: json["title"],
        content: json["content"],
        attendees: json["attendees"],
        location: json["location"],
        postedby: json["postedBy"]);
  }
}
