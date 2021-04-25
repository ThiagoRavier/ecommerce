import 'package:ecommerce/components/SmallTextWithArrow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'LoginScreenFrame.dart';

class ConfirmCode extends StatelessWidget {
  const ConfirmCode({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var telefone = '+55 (31) 98466-1600';
    return LoginScreenFrame(
      title: 'Código de Verificação',
      buttonLabel: 'Prosseguir',
      subtitleAction: () {},
      buttonAction: () {
        print('Login');
      },
      subtitleText: 'Reenviar Código',
      bodyText: 'Por favor, insira o código enviado para o número',
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(telefone),
                GestureDetector(
                  onTap: () {},
                  child: SmallTextWithArrow(
                    text: 'Alterar Telefone',
                    onTap: () => Navigator.pushNamed(context, '/login'),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.filled(
                4,
                Container(
                    height: 50,
                    width: 17,
                    child: Theme(
                      data: ThemeData(
                        primaryColor: Colors.red,
                        accentColor: Colors.greenAccent,
                      ),
                      child: TextField(
                        maxLength: 1,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(counterText: ''),
                        style: TextStyle(
                            fontSize: 25,
                            color: Theme.of(context).textTheme.bodyText1.color),
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
