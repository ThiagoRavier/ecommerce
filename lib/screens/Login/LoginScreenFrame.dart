import 'package:ecommerce/components/CustomScaffold/CustomScaffold.dart';
import 'package:ecommerce/components/GoldButton.dart';
import 'package:ecommerce/components/GradientTopWithText.dart';
import 'package:flutter/material.dart';

class LoginScreenFrame extends StatelessWidget {
  final String title;
  final Widget child;
  final String buttonLabel;
  final GestureTapCallback buttonAction;
  final String subtitleText;
  final GestureTapCallback subtitleAction;
  final String bodyText;

  const LoginScreenFrame(
      {Key key,
      this.title,
      this.child,
      this.buttonLabel,
      this.buttonAction,
      this.subtitleText,
      this.subtitleAction,
      this.bodyText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: GradientTopWithText(
        text: title,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 17, 8, 24),
            child: Text(bodyText, style: Theme.of(context).textTheme.subtitle2),
          ),
          child,
          SizedBox(height: 24),
          GoldButton(
            label: buttonLabel,
            onPressed: buttonAction,
          ),
          SizedBox(height: 24),
          GestureDetector(
            onTap: subtitleAction,
            child: Text(subtitleText,
                style: Theme.of(context).textTheme.headline3),
          ),
        ],
      ),
      bottomNavigationBar: UnconstrainedBox(),
      padding: EdgeInsets.all(16),
    );
  }
}
