import 'package:ecommerce/components/CustomScaffold/CustomScaffold.dart';
import 'package:ecommerce/components/TitleCard.dart';
import 'package:ecommerce/models/User.dart';
import 'package:ecommerce/screens/Profile/components/GradientTopUserInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileOption {
  String name;
  IconData icon;

  ProfileOption({this.name, this.icon});
}

List<ProfileOption> options = [
  ProfileOption(name: 'Endereços', icon: CupertinoIcons.map_pin_ellipse),
  ProfileOption(name: 'Formas de Pagamento', icon: CupertinoIcons.creditcard),
  ProfileOption(name: 'Pedidos', icon: Icons.list),
  ProfileOption(name: 'Favoritos', icon: Icons.favorite_outline_outlined),
  ProfileOption(name: 'Configurações', icon: CupertinoIcons.gear_alt),
  ProfileOption(name: 'Sair', icon: Icons.exit_to_app_rounded),
];

class UserProfile extends StatelessWidget {
  const UserProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ...options
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
        SizedBox(height: 20),
        Text(
          'Privacy Policy',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ]),
      appBar: GradientTopUserInfo(
        user: users[0],
      ),
      padding: EdgeInsets.all(16),
    );
  }
}
