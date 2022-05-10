import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../myWidgets/my_app_bar.dart';
import 'profile_logged_in.dart';
import 'profile_not_logged_in.dart';

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
