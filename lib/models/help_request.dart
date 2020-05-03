import 'package:iaidyou/models/help_category.dart';
import 'package:iaidyou/models/user.dart';

class HelpRequest {

  int id;
  User userRequest; 
  User userHelper;
  HelpCategory category;
  String status;
  double latitude;
  double longitude;
  String createdAt;
  String updatedAt;

  HelpRequest();

  HelpRequest.fromJson(Map<String, dynamic> json) :
    id          = json['id'],
    userRequest = User.fromJson(json['user_request']), 
    userHelper  = User.fromJson(json['user_helper']),
    category  = json['category'],
    status    = json['status'],
    latitude  = json['latitude'],
    longitude = json['longitude'],
    createdAt = json['created_at'],
    updatedAt = json['updated_at'];


    Map<String, dynamic> toJson() => { 
      'id' : id,
      'user_request' : userRequest.toJson(),
      'user_helper' : userHelper.toJson(),
      'category' : category.toJson(),
      'status' : status,
      'latitude' : latitude,
      'longitude' : longitude,
      'created_at' : createdAt,
      'updated_at' : createdAt
    };
}