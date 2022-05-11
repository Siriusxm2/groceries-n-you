import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import 'package:flutter_svg/flutter_svg.dart';

class MyFloatingButton extends StatelessWidget {
  const MyFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        devtools.log('Button pressed!');
      },
      child: SvgPicture.asset(
        '../../assets/bla.svg',
        fit: BoxFit.cover,
        width: 30,
        height: 30,
      ),
      backgroundColor: Colors.white,
      shape: const CircleBorder(
        side: BorderSide(
          color: Color(0xff4382FF),
          width: 3.0,
        ),
      ),
    );
  }
}
