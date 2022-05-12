import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:groceries_n_you/firebase/firebase_options.dart';
import 'package:groceries_n_you/home_page.dart';

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
            return const HomePage();
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
