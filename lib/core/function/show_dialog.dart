import 'package:flutter/material.dart';

Future<void> customShowAlertDialog({
  required BuildContext context,
  required Widget title,
  required Widget text,
  required Widget no,
  required Widget yes,
  VoidCallback? noFunction,
  VoidCallback? yesFunction,
  bool barrierDismissible = true,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible, // user must tap button,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)), //this right here
        title: title,
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              text,
            ],
          ),
        ),
        actions: <Widget>[
          no,
          yes,
        ],
      );
    },
  );
}
