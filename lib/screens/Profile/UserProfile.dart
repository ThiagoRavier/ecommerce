import 'package:ecommerce/components/CustomScaffold.dart';
import 'package:ecommerce/components/TitleCard.dart';
import 'package:ecommerce/models/User.dart';
import 'package:ecommerce/screens/Profile/components/GradientTopUserInfo.dart';
import 'package:flutter/material.dart';

class ProfileOption {
  String name;
  IconData icon;

  ProfileOption({this.name, this.icon});
}

List<ProfileOption> options = [
  ProfileOption(name: 'Pedidos', icon: Icons.list),
  ProfileOption(name: 'Formas de Pagamento', icon: Icons.credit_card_outlined),
  ProfileOption(name: 'Dados Pessoas', icon: Icons.person_outline),
  ProfileOption(name: 'Favoritos', icon: Icons.favorite_outline_outlined),
];

class UserProfile extends StatelessWidget {
  const UserProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: options
            .map<Widget>(
              (o) => GestureDetector(
                onTap: () {},
                child: TitleCard(
                  title: o.name,
                  icon: o.icon,
                ),
              ),
            )
            .toList(),
      ),
      appBar: GradientTopUserInfo(
        user: users[0],
      ),
      bottomNavigationBar: null,
    );
  }
}
