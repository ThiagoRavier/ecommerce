import 'package:ecommerce/components/CustomScaffold/CustomScaffold.dart';
import 'package:ecommerce/components/ShoppingBottomFrame.dart';
import 'package:ecommerce/models/PaymentMethod.dart';
import 'package:ecommerce/routes.dart';
import 'package:ecommerce/models/User.dart';
import 'package:ecommerce/screens/FinishOrder/components/InfoCardWithTitle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/AddressCard.dart';
import 'components/PaymentCard.dart';

class FinishOrder extends StatelessWidget {
  const FinishOrder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          InfoCardWithTitle(
            text: 'Endereço',
            icon: CupertinoIcons.map_pin_ellipse,
            onTap: () {},
            child: AddressCard(user: users[0]),
          ),
          InfoCardWithTitle(
            text: 'Forma de Pagamento',
            icon: CupertinoIcons.creditcard,
            onTap: () {},
            child: PaymentCard(paymentMethod: Pix()),
          )
        ],
      ),
      appBarInfo: BottomBarInfo(
        hasSearch: false,
        label: 'Finalizar Pedido',
      ),
      bottomNavigationBar: ShoppingBottomFrame(
        buttonLabel: 'Continuar',
        buttonAction: () => Navigator.pushNamed(context, '/finish-order'),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
    );
  }
}
