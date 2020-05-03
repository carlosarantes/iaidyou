class Address {

    int id;
    String address;
    String address2;
    String city;
    String postalCode;
    String province;
    String country;
    double latitude;
    double longitude;

    Address();
    
    Address.fromJson(Map<String, dynamic> json) : 
      id       = json['id'],
      address  = json['address'],
      address2 = json['address_2'],
      city     = json['city'],
      postalCode = json['postal_code'],
      province   = json['province'],
      country    = json['country'],
      latitude   = json['latitude'],
      longitude  = json['longitude'];


    Map<String, dynamic> toJson() => {
      'id' : id,
      'address' : address,
      'address_2' : address2,
      'city' : city,
      'postal_code' : postalCode,
      'province' : province,
      'country' : country,
      'latitude' : latitude,
      'longitude' : longitude,
    };

 }