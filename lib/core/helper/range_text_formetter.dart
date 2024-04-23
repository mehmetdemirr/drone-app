import 'package:flutter/services.dart';

class RangeTextInputFormatter extends TextInputFormatter {
  final int min;
  final int max;

  RangeTextInputFormatter({required this.min, required this.max});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int value = int.tryParse(newValue.text) ?? 0;

    if (value < min) {
      return TextEditingValue(
        text: min.toString(),
        selection: TextSelection.collapsed(offset: min.toString().length),
      );
    } else if (value > max) {
      return TextEditingValue(
        text: max.toString(),
        selection: TextSelection.collapsed(offset: max.toString().length),
      );
    }

    return newValue;
  }
}
