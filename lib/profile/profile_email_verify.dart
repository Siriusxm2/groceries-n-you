import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../myWidgets/my_header.dart';

class VerifyEmail extends StatefulWidget {
  final User? fbUser;
  VerifyEmail({Key? key, required this.fbUser}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  late User? user;

  @override
  void initState() {
    user = widget.fbUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          MyHeaderWidget(
            text: 'Verify email',
          ),
          Container(
            width: 300,
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            child: const Text(
              'You need to verify your email! To send a verification link to the email you have registered with please click the button.',
            ),
          ),
          TextButton(
            onPressed: () async {
              await user?.sendEmailVerification();
            },
            child: const Text(
              'Send verification email',
            ),
          ),
        ],
      ),
    );
  }
}
