import 'package:ecommerce/components/PurpleGradient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'InfoCard.dart';

class InfoCardWithTitle extends StatelessWidget {
  const InfoCardWithTitle(
      {Key key, this.icon, this.text, this.child, this.onTap})
      : super(key: key);

  final IconData icon;
  final String text;
  final Widget child;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _GradientTitle(
          icon: icon,
          text: text,
        ),
        InfoCard(
          child: child,
          onTap: onTap,
        ),
      ],
    );
  }
}

class _GradientTitle extends StatelessWidget {
  const _GradientTitle({Key key, this.icon, this.text}) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    Widget shaderWrapper(Widget child) => ShaderMask(
        shaderCallback: createCallbackForShader(context), child: child);
    return Padding(
      padding: const EdgeInsets.only(top: 28.0, bottom: 16),
      child: Row(
        children: [
          shaderWrapper(Icon(
            icon,
            color: Colors.white,
            size: 24,
          )),
          SizedBox(width: 12),
          shaderWrapper(Text(
            text,
            style: Theme.of(context).textTheme.headline2.copyWith(
                  color: Colors.white,
                ),
          )),
        ],
      ),
    );
  }
}
