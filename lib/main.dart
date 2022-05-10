import 'package:flutter/material.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:shop_app/constants/routes.dart';
import 'package:shop_app/profile/profile_email_verify.dart';
import 'package:shop_app/profile/profile_login.dart';
import 'package:shop_app/profile/profile.dart';
import 'package:shop_app/profile/profile_register.dart';
import 'package:shop_app/firebase/firebase_user_auth.dart';

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
        profileRoute: ((context) => ProfileView()),
        loginRoute: ((context) => const ProfileLogin()),
        registerRoute: ((context) => const ProfileRegister()),
        verifyRoute: ((context) => const VerifyEmail()),
      },
    ),
  );
}
