import 'dart:async';
import 'package:equatable/equatable.dart';
//import 'package:hagerawi_app/admin_feeds/admin_feeds_model.dart';

// event base class
abstract class AdminFeedEvent  extends Equatable{}

class PostAdminFeedsEvent extends AdminFeedEvent {
  final String _title;
  final String _author;
  final String _desc;
  final String _detailed;
  

  
  PostAdminFeedsEvent(this._title, this._desc,
  this._detailed,this._author);

  @override
  List<Object?> get props => [_title, _author,_desc,_detailed];
}




// state base class
