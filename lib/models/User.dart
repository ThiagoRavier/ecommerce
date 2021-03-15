import 'package:ecommerce/models/Address.dart';
import 'ProductCategory.dart';

class User {
  String firstName;
  String lastName;
  String emailAddress;
  String phoneNumber;
  String profilePicture;
  Address address;

  User({
    this.firstName,
    this.lastName,
    this.emailAddress,
    this.phoneNumber,
    this.profilePicture,
    this.address,
  });

  String get fullName => '$firstName $lastName';
}

List<User> users = [
  User(
      firstName: 'Thiago',
      lastName: 'Maia',
      emailAddress: 'tthiagopmaia@gmail.com',
      phoneNumber: '(31) 98466-1600',
      profilePicture: productCategories[1].image,
      address: Address(
        borough: 'Nossa Senhora do Carmo',
        streetType: 'Rua',
        streetName: 'Boa Esperança',
        number: 426,
        compliment: 'Apto. 202',
        city: 'Ouro Preto',
        state: 'MG',
        zipCode: '35400-000',
      )),
];
