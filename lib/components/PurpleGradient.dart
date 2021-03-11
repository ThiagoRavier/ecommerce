import 'package:flutter/material.dart';

LinearGradient getGradient(BuildContext context) {
  return LinearGradient(
    colors: [
      Theme.of(context).accentColor,
      Theme.of(context).primaryColor,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}

Decoration purpleGradient(
    {BuildContext context, BorderRadius borderRadius = BorderRadius.zero}) {
  return BoxDecoration(
    borderRadius: borderRadius,
    gradient: getGradient(context),
  );
}

Shader getShader(BuildContext context) =>
    getGradient(context).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

Shader Function(Rect) createCallbackForShader(BuildContext context) =>
    (Rect bounds) => getGradient(context).createShader(bounds);

class PurpleShade extends StatelessWidget {
  final Widget child;
  final bool active;

  const PurpleShade(this.child, {this.active = true});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: this.active ? BlendMode.modulate : BlendMode.dst,
      shaderCallback: createCallbackForShader(context),
      child: child,
    );
  }
}

// usage: Text(
//     'Hello Gradients!',
//     style: new TextStyle(
//         fontSize: 60.0,
//         fontWeight: FontWeight.bold,
//         foreground: Paint()..shader = getShader(context)),
//   )