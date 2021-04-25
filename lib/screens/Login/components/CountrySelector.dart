import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
// import 'package:country_code_picker/country_localizations.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';

class CountrySelector extends StatelessWidget {
  const CountrySelector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return Container(
      width: 100,
      child: CountryCodePicker(
        dialogSize: Size(
          s.width * 0.9,
          s.height * 0.7,
        ),
        initialSelection: '+55',
        padding: EdgeInsets.all(0),
        flagDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
        ),
      ),
      // Container(
      //   width: 32,
      //   decoration: BoxDecoration(
      //       image: DecorationImage(image: NetworkImage(Pix().image))),
      // )),
      // DropdownButton(items: [],),
    );
  }
}
