// import 'dart:convert';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:iaidyou/http/common_webclient.dart';
import 'package:iaidyou/models/address.dart';
import 'package:iaidyou/models/user.dart';


class UserWebClient {

  Future<Address> getAddress(double latitude, double longitude) async {

    final String geocodingUrl = "https://maps.googleapis.com/maps/api/geocode/json?latlng=${ latitude.toString() },${ longitude.toString() }&key=AIzaSyCEfA_qUpRD-fTEHkMyfnB9t3kM7IkQP7w";
    final Response response = await commonWebclient.get(geocodingUrl);

    print(geocodingUrl);


    try {
        Map<String, dynamic> responseJson = jsonDecode(response.body);
    
        List<dynamic> addressComponents = responseJson['results'][1]['address_components'];

        Address address = Address();

        address.address  = addressComponents[0]['long_name']+', '+addressComponents[1]['short_name']; // Street
        address.address2 = addressComponents[2]['long_name'];  // Neightboorhood
        address.city     = addressComponents[3]['long_name']; // City
        address.province = addressComponents[4]['long_name']; // Provinve/State
        address.country  = addressComponents[5]['long_name'];  // Country
        address.postalCode = addressComponents[6]['long_name']; // Postalcode
        address.latitude   = latitude;
        address.longitude  = longitude;

        return address;
    } catch(error) {
        return null;
    }
  }


  Future<User> login(String phoneNumber) async {

    final String url = baseUrl+'/guest/login';
    Map<String, String> body = Map<String, String>();
    body['phone_number'] = phoneNumber;

    print(url);
    
    final Response response = await commonWebclient.post(url, body: body);
    print(response.statusCode );

    return null;

  }

  Future<User> register(User user) async {

    final String url = baseUrl+'/guest/register';
    print(url);
  

    final Response response = await commonWebclient.post(url, body: jsonEncode(user.toJson()) );
    print(response.statusCode );

    return null;
  }



}