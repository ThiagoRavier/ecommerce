import 'CatalogueTypes.dart';

class User {
  String firstName;
  String lastName;
  String emailAddress;
  String phoneNumber;
  String profilePicture;

  User(
      {this.firstName,
      this.lastName,
      this.emailAddress,
      this.phoneNumber,
      this.profilePicture});
}

List<User> users = [
  User(
    firstName: 'Thiago',
    lastName: 'Maia',
    emailAddress: 'tthiagopmaia@gmail.com',
    phoneNumber: '(31) 98466-1600',
    profilePicture: catalogueTypes[1].image,
  ),
];
