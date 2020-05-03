
import 'package:iaidyou/models/help_request.dart';
import 'package:iaidyou/models/user.dart';

class RequestOffer {

  int id;
  HelpRequest helpRequest;
  bool approved;
  User userHelper;
  String createdAt;
  String updatedAt;

  RequestOffer();

  RequestOffer.fromJson(Map<String, dynamic> json) : 
    id = json['id'],
    helpRequest = HelpRequest.fromJson(json['help_request']),
    approved = json['approved'],
    userHelper = User.fromJson(json['user_helper']),
    createdAt = json['created_at'],
    updatedAt = json['updated_at'];

  Map<String, dynamic> toJson() => {
    'id' : id,
    'help_request' : helpRequest.toJson(),
    'approved' : approved,
    'user_helper' : userHelper.toJson(),
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}