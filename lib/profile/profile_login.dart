import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_app/custom_widget_functions.dart';

import '../myWidgets/my_app_bar.dart';
import '../customIcons/custom_icons_icons.dart';
import '../myWidgets/my_header.dart';

class ProfileLogin extends StatefulWidget {
  const ProfileLogin({Key? key}) : super(key: key);

  @override
  State<ProfileLogin> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfileLogin> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  bool _obscurePassword = true;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Center(
        child: Stack(
          children: [
            Column(
              children: [
                const MyHeaderWidget(
                  text: 'Log in to your account',
                ),
                Container(
                  width: 300,
                  height: 30,
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 6),
                  child: TextField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(12, 0, 10, 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xffD4D4D4),
                        ),
                      ),
                      hintText: 'Enter email...',
                      hintStyle: TextStyle(
                        color: Color(0xff959595),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 30,
                  child: TextField(
                    controller: _password,
                    enableSuggestions: false,
                    obscureText: _obscurePassword,
                    autocorrect: false,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(12, 0, 10, 0),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xffD4D4D4),
                        ),
                      ),
                      hintText: 'Enter password...',
                      hintStyle: const TextStyle(
                        color: Color(0xff959595),
                      ),
                      suffixIcon: GestureDetector(
                        child: Icon(
                          _obscurePassword
                              ? CustomIcons.eyeOff
                              : CustomIcons.eye,
                          color: const Color(0xff666666),
                          size: 20,
                        ),
                        onTap: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      suffixIconColor: const Color(0xff666666),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final email = _email.text;
                    final password = _password.text;
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      CustomWidgets.mySnackBarWidget(
                        context,
                        'Logged in successfully!',
                      );
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        '/',
                        (_) => false,
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        CustomWidgets.mySnackBarWidget(
                          context,
                          'User has been deleted or never existed!',
                        );
                      } else if (e.code == 'wrong-password') {
                        CustomWidgets.mySnackBarWidget(
                          context,
                          'Wrong password!',
                        );
                      } else if (e.code == 'invalid-email') {
                        CustomWidgets.mySnackBarWidget(
                          context,
                          'Invalid email!',
                        );
                      }
                    }
                  },
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Color(0xff333333),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    primary: const Color(0xff8EB4FF),
                    side: const BorderSide(
                      color: Color(0xffFFAE2D),
                    ),
                    fixedSize: const Size(340.0, 30.0),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 110,
              left: 0,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/register/',
                    (route) => true,
                  );
                },
                child: const Text(
                  'No profile? Register here.',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Color(0xff333333),
                    fontSize: 10.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
