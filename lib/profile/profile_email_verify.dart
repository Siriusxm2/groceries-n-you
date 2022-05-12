import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:groceries_n_you/constants/routes.dart';
import 'package:groceries_n_you/custom_widget_functions.dart';
import 'package:groceries_n_you/myWidgets/my_app_bar.dart';

import '../myWidgets/my_header.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Center(
        child: Column(
          children: [
            const MyHeaderWidget(
              text: 'Verify email',
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: 300,
              child: Column(
                children: const [
                  Text(
                    'A verification email has already been sent.',
                  ),
                  Text(
                    'Please verify your email before logging in.',
                  ),
                  Text(
                    'If you do not recieve an email tap on Resend.',
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final user = FirebaseAuth.instance.currentUser;
                    await user?.sendEmailVerification();
                    await CustomWidgets.mySnackBarWidget(
                      context,
                      'Verification email sent!',
                    );
                  },
                  child: const Text(
                    'Resend',
                    style: TextStyle(
                      color: Color(0xff333333),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff8EB4FF),
                    side: const BorderSide(
                      color: Color(0xffFFAE2D),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      registerRoute,
                      (route) => false,
                    );
                  },
                  child: const Text(
                    'Restart',
                    style: TextStyle(
                      color: Color(0xff333333),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff8EB4FF),
                    side: const BorderSide(
                      color: Color(0xffFFAE2D),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
