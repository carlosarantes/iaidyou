import 'package:iaidyou/models/address.dart';

class User {

  int id;
  String name;
  String phoneNumber;
  String type; /* ELDER, YOUNGER */
  String picture;
  Address address;

  User();

  User.fromJson(Map<String, dynamic> json) : 
    id          = json['id'],
    name        = json['name'],
    phoneNumber = json['phone_number'],
    type    = json['type'], 
    picture = json['picture'],
    address = Address.fromJson(json['address']);


  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'phone_number' : phoneNumber,
    'type' : type,
    'picture' : picture,
    'address' : address.toJson()
  };

  @override
  String toString() {
    return 'ID: ${id} - Name: ${name}, phone: ${phoneNumber}, userType: ${type}';
  }
}

