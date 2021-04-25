import 'package:ecommerce/screens/login/components/PhoneFormatter.dart';
import 'package:ecommerce/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'LoginScreenFrame.dart';

import 'components/CountrySelector.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  void confirmCode(context) {
    //TODO enviar SMS
    Navigator.pushNamed(context, '/confirm-code');
  }

  @override
  Widget build(BuildContext context) {
    var mask = '(00) 00000-0000';
    return LoginScreenFrame(
      title: 'Qual seu número de telefone?',
      buttonLabel: 'Enviar SMS',
      subtitleAction: () => Navigator.pushNamed(context, '/home'),
      buttonAction: () => confirmCode(context),
      subtitleText: 'Pular',
      bodyText:
          'Por favor, insira seu número de telefone para confirmar sua conta:',
      child: Column(
        children: [
          Container(
            decoration: inputDecoration(context),
            child: Row(
              children: [
                SizedBox(width: 8),
                CountrySelector(),
                Expanded(
                  child: TextField(
                      // focusNode: focusNode,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        NumberFormatter(mask),
                      ],
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      onChanged: (x) => print(x),
                      cursorColor: Colors.grey[700],
                      decoration: InputDecoration(
                        hintText: mask,
                        border: InputBorder.none,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
