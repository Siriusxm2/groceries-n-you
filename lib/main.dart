import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:groceries_n_you/about/about_page.dart';
import 'package:groceries_n_you/about/contacts_page.dart';
import 'package:groceries_n_you/categories/category_page.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:groceries_n_you/constants/routes.dart';
import 'package:groceries_n_you/profile/profile_email_verify.dart';
import 'package:groceries_n_you/profile/profile_login.dart';
import 'package:groceries_n_you/profile/profile.dart';
import 'package:groceries_n_you/profile/profile_register.dart';
import 'package:groceries_n_you/services/auth/firebase_user_auth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
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
        aboutRoute: ((context) => const AboutUsPage()),
        contactRoute: ((context) => const ContactsPage()),
        categoryRoute: ((context) => const CategoryPage()),
      },
    ),
  );
}
