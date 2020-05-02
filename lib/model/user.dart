class User {

  int id;
  String name;
  String phone;
  String userType; /* ELDER, YOUNGER */
  String address;

  User();

  @override
  String toString() {
    return 'ID: ${id} - Name: ${name}, phone: ${phone}, userType: ${userType}, address: ${address}';
  }
}