import 'User.dart';

class Address {
  User receiver;
  String streetType;
  String streetName;
  String city;
  String state;
  String country;
  String zipCode;
  String borough;
  String compliment;
  int number;

  Address({
    this.receiver,
    this.streetType,
    this.streetName,
    this.city,
    this.state,
    this.country = 'Brasil',
    this.zipCode,
    this.borough,
    this.compliment = '',
    this.number,
  });

  String get addressString =>
      '$streetType $streetName, $number${compliment.length > 0 ? ' ' + compliment : ''}\n$borough, $city - $state ${country != 'Brasil' ? country : ''}\n$zipCode';
}
