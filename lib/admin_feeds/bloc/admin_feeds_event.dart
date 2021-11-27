import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hagerawi_app/admin_feeds/screens/feeds_post.dart';

// event base class
abstract class AdminFeedEvent extends Equatable {}

class PostFeedsEvent extends AdminFeedEvent {
  final String title;
  final String author;
  final String content;
  final String detailed;

  PostFeedsEvent(this.title, this.author, this.content, this.detailed);

  @override
  List<Object?> get props => [title, author, content, detailed];
}

class UpdateFeedEvent extends AdminFeedEvent {
  final String id;

  UpdateFeedEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class DeleteFeedEvent extends AdminFeedEvent {
  final String id;

  DeleteFeedEvent(this.id);

  @override
  List<Object?> get props => [id];
}
