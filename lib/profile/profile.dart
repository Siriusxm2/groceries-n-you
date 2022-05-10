import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/myWidgets/my_app_bar.dart';
import 'package:shop_app/profile/profile_logged_in.dart';
import 'package:shop_app/profile/profile_not_logged_in.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: (user != null)
          ? const ProfileViewLogged()
          : const ProfileViewNotLogged(),
    );
  }
}
