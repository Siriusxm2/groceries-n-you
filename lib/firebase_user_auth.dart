import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/home_page.dart';
import 'dart:developer' as devtools show log;

import 'profile/profile_email_verify.dart';
import 'firebase/firebase_options.dart';

class MyFirebaseUserAuth extends StatelessWidget {
  const MyFirebaseUserAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              if (user.emailVerified) {
                devtools.log('Email verified');
                return const HomePage();
              } else {
                return VerifyEmail(
                  fbUser: user,
                );
              }
            } else {
              return const HomePage();
            }

          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
