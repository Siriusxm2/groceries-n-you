import 'package:flutter/material.dart';
import 'package:groceries_n_you/dimensions.dart';

class CustomWidgets {
  CustomWidgets._();

  static mySnackBarWidget(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color(0xff333333),
        ),
      ),
      backgroundColor: const Color(0xffFFBE57),
      duration: const Duration(milliseconds: 2000),
      behavior: SnackBarBehavior.floating,
      width: Dimensions.width200,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Color(0xff699BFF),
        ),
        borderRadius: BorderRadius.circular(Dimensions.border10),
      ),
    ));
  }

  static Future<bool> showErrorDialog(BuildContext context, String message) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Oops...'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    ).then((value) => value ?? false);
  }
}
