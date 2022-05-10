import 'package:flutter/material.dart';
import 'package:material_color_generator/material_color_generator.dart';

import 'profile/profile_login.dart';
import 'profile/profile.dart';
import 'profile/profile_register.dart';
import 'firebase_user_auth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: "Groceries 'N' You",
      theme: ThemeData(
        primarySwatch: generateMaterialColor(
          color: const Color(0xff699BFF),
        ),
      ),
      home: const MyFirebaseUserAuth(),
      routes: {
        '/profile/': ((context) => ProfileView()),
        '/login/': ((context) => const ProfileLogin()),
        '/register/': ((context) => const ProfileRegister()),
      },
    ),
  );
}
