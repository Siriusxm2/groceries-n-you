import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../myWidgets/my_header.dart';

class ProfileViewLogged extends StatelessWidget {
  const ProfileViewLogged({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Column(
            children: [
              const MyHeaderWidget(
                text: 'Profile',
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'View Orders',
                  style: TextStyle(
                    color: Color(0xff333333),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff8EB4FF),
                  side: const BorderSide(
                    color: Color(0xffFFAE2D),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Order History',
                  style: TextStyle(
                    color: Color(0xff333333),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff8EB4FF),
                  side: const BorderSide(
                    color: Color(0xffFFAE2D),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Settings',
                  style: TextStyle(
                    color: Color(0xff333333),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff8EB4FF),
                  side: const BorderSide(
                    color: Color(0xffFFAE2D),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  final shouldLogout = await showLogOutDialog(context);
                  if (shouldLogout) {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      '/login/',
                      (_) => false,
                    );
                  }
                },
                child: const Text(
                  'Log out',
                  style: TextStyle(
                    color: Color(0xff333333),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff8EB4FF),
                  side: const BorderSide(
                    color: Color(0xffFFAE2D),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Sign out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('Log out'),
          ),
        ],
      );
    },
  ).then((value) => value ?? false);
}
