import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/profile/profile_email_verify.dart';

import 'firebase/firebase_options.dart';
import 'myWidgets/my_app_bar.dart';
import '../homePage/product_manager.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              final emailVerified = user?.emailVerified ?? false;
              if (emailVerified) {
                return ProductManager(
                  startingOffers: 'assets/Lasagna.png',
                );
              } else {
                return VerifyEmail(
                  fbUser: user,
                );
              }
            default:
              return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
