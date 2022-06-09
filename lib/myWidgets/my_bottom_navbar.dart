import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:groceries_n_you/constants/routes.dart';
import 'package:groceries_n_you/dimensions.dart';

class MyBottomNavbar extends StatelessWidget {
  const MyBottomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height130,
      child: BottomAppBar(
        color: const Color(0xff8EB4FF),
        child: Column(
          children: [
            OutlinedButton(
              onPressed: () {
                if (ModalRoute.of(context)!.settings.name != aboutRoute) {
                  Navigator.of(context).pushNamed(aboutRoute);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'ABOUT US',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(
                        0xff000000,
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: 90 * math.pi / 180,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.expand_less,
                        color: Color(0xff666666),
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width15),
                side: const BorderSide(
                  color: Color(0xffB4CDFF),
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                if (ModalRoute.of(context)!.settings.name != contactRoute) {
                  Navigator.of(context).pushNamed(contactRoute);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'CONTACT AND HELP',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(
                        0xff000000,
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: 90 * math.pi / 180,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.expand_less,
                        color: Color(0xff666666),
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width15),
                side: const BorderSide(
                  color: Color(0xffB4CDFF),
                ),
              ),
            ),
            Container(
              height: Dimensions.height33,
              alignment: AlignmentDirectional.center,
              child: Text(
                'All rights reserved',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xff000000),
                  fontSize: Dimensions.font10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
