import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

class ProgramModel {
  final title;
  final desc;
  final location;
  final time;
  final attendees;
  final postedby;

  ProgramModel(this.title, this.time, this.desc, this.location, this.attendees,
      this.postedby);

  factory ProgramModel.fromJson(Map<String, dynamic> json) {
    return ProgramModel(json["title"], json["content"], json["attendees"],
        json["time"], json["location"], json["postedby"]);
  }
}
