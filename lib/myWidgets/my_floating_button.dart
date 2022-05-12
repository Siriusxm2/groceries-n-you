import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

class MyFloatingButton extends StatelessWidget {
  const MyFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: FloatingActionButton(
        onPressed: () {
          devtools.log('Button pressed!');
        },
        child: Image.asset(
          'assets/chatButton.png',
          height: 30,
          width: 30,
        ),
        backgroundColor: Colors.white,
        shape: const CircleBorder(
          side: BorderSide(
            color: Color(0xff4382FF),
            width: 3.0,
          ),
        ),
      ),
    );
  }
}
