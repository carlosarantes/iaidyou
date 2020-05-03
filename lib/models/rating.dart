import 'package:iaidyou/models/help_request.dart';
import 'package:iaidyou/models/user.dart';

class Rating {

  int id;
  User userRequest;
  User userHelper;
  int rating;
  String review;
  HelpRequest helpRequest;
  String createdAt;
  String updatedAt;

  Rating();

  Rating.fromJson(Map<String, dynamic> json) : 
    id          = json['id'],
    userRequest = User.fromJson(json['user_request']),
    userHelper  = User.fromJson(json['user_helper']) ,
    rating      = json['rating'],
    review      = json['review'],
    helpRequest = HelpRequest.fromJson(json['help_request']),
    createdAt   = json['created_at'],
    updatedAt   = json['updated_at'];
  
  Map<String, dynamic> toJson() => {
    'id' : id,
    'user_request' : userRequest.toJson(),
    'user_helper'  : userHelper.toJson(),
    'rating' : rating,
    'review' : review,
    'help_request' : helpRequest.toJson(),
    'created_at'   : createdAt,
    'updated_at'   : updatedAt,
  };

}