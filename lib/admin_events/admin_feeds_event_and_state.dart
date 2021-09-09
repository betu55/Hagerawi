import 'dart:async';

import 'package:hagerawi_app/admin_feeds/admin_feeds_model.dart';

// event base class
abstract class AdminFeedEvent {}

class PostAdminFeedsEvent extends AdminFeedEvent {
  final String title;
  final String desc;
  final String detail;
  final String author;

  PostAdminFeedsEvent(
      {required this.title,
      required this.desc,
      required this.detail,
      required this.author});
}

class SearchFeedEvent extends AdminFeedEvent {}


// state base class
