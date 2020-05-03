import 'dart:convert';
import 'package:http/http.dart';
import 'package:iaidyou/http/common_webclient.dart';


class UserWebClient {

  final String url = baseUrl + '/user';
  
  Future<bool> login () async {
    return true;
  }
}