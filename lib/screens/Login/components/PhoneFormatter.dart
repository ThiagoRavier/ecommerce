import 'package:flutter/services.dart';
import 'dart:math' as Math;

class NumberFormatter extends TextInputFormatter {
  String mask;

  NumberFormatter(this.mask);

  static const numChar = '0';

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText;
    int offset = 0;
    int i;
    List<String> newV = newValue.text.split('');
    if (newV.length > 0) {
      List<String> maskChars = mask.split('');
      var contador = 0;
      offset = Math.min(newValue.selection.start,
          maskChars.where((c) => c == numChar).length);
      for (i = 0;
          i < maskChars.length &&
              (contador < newV.length || maskChars[i] != numChar);
          i++) {
        if (maskChars[i] == numChar) {
          maskChars[i] = newV[contador];
          contador++;
        } else if (contador < newValue.selection.start) offset++;
      }

      newText = maskChars.sublist(0, i).join('');
    } else
      return null;
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: offset),
    );
  }
}
