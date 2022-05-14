import 'package:flutter/material.dart';

class MySeeHereButton extends StatelessWidget {
  void Function() onPressed;

  MySeeHereButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text(
        'ВИЖ ТУК',
        style: TextStyle(
          color: Color(0xff333333),
          fontSize: 10,
          fontWeight: FontWeight.w700,
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        primary: const Color(0xffFFBE57),
        side: const BorderSide(
          width: 0.5,
          color: Color(0xff699BFF),
        ),
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        fixedSize: const Size(70.0, 20.0),
      ),
    );
  }
}
