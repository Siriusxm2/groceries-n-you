import 'package:flutter/material.dart';

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
      width: 200.0,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Color(0xff699BFF),
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
    ));
  }
}
