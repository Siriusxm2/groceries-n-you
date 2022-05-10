import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:material_color_generator/material_color_generator.dart';

import 'firebase/firebase_options.dart';
import 'myWidgets/my_app_bar.dart';
import '../homePage/product_manager.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: generateMaterialColor(color: const Color(0xff699BFF)),
      ),
      home: Scaffold(
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
                  print('You are a verified user!');
                } else {
                  print('You need to verify your email!');
                }
                return ProductManager(
                  startingOffers: 'assets/Lasagna.png',
                );
              default:
                return const Text('Loading...');
            }
          },
        ),
      ),
    );
  }
}
