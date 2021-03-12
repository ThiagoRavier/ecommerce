// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import 'package:ecommerce/theme/theme.dart';
// import './components/CustomBottomBarNavigator.dart';
// import './components/GradientAppBar.dart';
// import 'package:ecommerce/sizeConfig.dart';

// import 'package:ecommerce/routes.dart';

// class AppNavigator extends StatefulWidget {
//   @override
//   _AppNavigatorState createState() => _AppNavigatorState();
// }

// class _AppNavigatorState extends State<AppNavigator> {
//   var screenIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     var screenInfo = routes.values.toList()[screenIndex];
//     return MaterialApp(
//       theme: myAppTheme(),
//       home: Scaffold(
//           resizeToAvoidBottomInset: false,
//           bottomNavigationBar: CustomBottomBarNavigator(
//             routes: routes,
//             onTap: (String route) {
//               Navigator.of(context).push();
//             },
//             currentIndex: screenIndex,
//           ),
//           body: Container(
//             width: MediaQuery.of(context).size.width,
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
                  // GradientAppBar(
                  //   title: screenInfo.label,
                  //   iconLeft: screenInfo.iconLeft,
                  //   rightCornerWidget: screenInfo.rightCornerWidget,
                  // ),
//                   Container(
//                     child: screenInfo.builder(context),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
