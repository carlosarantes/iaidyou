// import 'dart:convert';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:iaidyou/http/common_webclient.dart';
import 'package:iaidyou/models/address.dart';


class UserWebClient {

  final String url = baseUrl + '/user';
  
  Future<bool> login () async {
    return true;
  }

  Future<Address> getAddress(double latitude, double longitude) async {

    final String geocodingUrl = "https://maps.googleapis.com/maps/api/geocode/json?latlng=${ latitude.toString() },${ longitude.toString() }&key=AIzaSyCEfA_qUpRD-fTEHkMyfnB9t3kM7IkQP7w";
    final Response response = await commonWebclient.get(geocodingUrl);

    print(geocodingUrl);


    try {
        Map<String, dynamic> responseJson = jsonDecode(response.body);
    
        List<dynamic> addressComponents = responseJson['results'][1]['address_components'];

        Address address = Address();

        print(addressComponents[0]['long_name'] );


        address.address  = addressComponents[0]['long_name']+', '+addressComponents[1]['short_name']; // Street
        address.address2 = addressComponents[2]['long_name'];  // Neightboorhood
        address.city     = addressComponents[3]['long_name']; // City
        address.province = addressComponents[4]['long_name']; // Provinve/State
        address.country  = addressComponents[5]['long_name'];  // Country
        address.postalCode = addressComponents[6]['long_name']; // Postalcode
        address.latitude   = latitude;
        address.longitude  = longitude;

        print(address);

        return address;
    } catch(error) {
        return null;
    }
  }

  // 




}