import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

class ProgramModel {
  final title;
  final content;
  final location;
  final time;
  final attendees;
  final postedby;

  ProgramModel(
      {this.title,
      this.time,
      this.content,
      this.location,
      this.attendees,
      this.postedby});

  factory ProgramModel.fromJson(Map<String, dynamic> json) {
    return ProgramModel(
        title: json["title"],
        content: json["content"],
        attendees: json["attendees"],
        time: json["time"],
        location: json["location"],
        postedby: json["postedby"]);
  }
}
