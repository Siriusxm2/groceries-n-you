import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_app/custom_widget_functions.dart';
import 'package:shop_app/myWidgets/my_header.dart';

import '../customIcons/custom_icons_icons.dart';
import '../myWidgets/my_app_bar.dart';

class ProfileRegister extends StatefulWidget {
  const ProfileRegister({Key? key}) : super(key: key);

  @override
  State<ProfileRegister> createState() => _ProfileRegisterPageState();
}

class _ProfileRegisterPageState extends State<ProfileRegister> {
  late final TextEditingController _email;
  // late final TextEditingController _username;
  late final TextEditingController _password;
  // late final TextEditingController _password2;
  bool _obscurePassword = true;
  // bool _obscurePassword2 = true;

  @override
  void initState() {
    _email = TextEditingController();
    // _username = TextEditingController();
    _password = TextEditingController();
    // _password2 = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    // _username.dispose();
    _password.dispose();
    // _password2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Stack(
        children: [
          Column(
            children: [
              const MyHeaderWidget(
                text: 'Register an account',
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
              // Container(
              //   width: 300,
              //   height: 30,
              //   margin: const EdgeInsets.fromLTRB(0, 10, 0, 6),
              //   child: TextField(
              //     controller: _username,
              //     autocorrect: false,
              //     decoration: const InputDecoration(
              //       contentPadding: EdgeInsets.fromLTRB(12, 0, 10, 0),
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //         borderSide: BorderSide(
              //           color: Color(0xffD4D4D4),
              //         ),
              //       ),
              //       hintText: 'Enter email...',
              //       hintStyle: TextStyle(
              //         color: Color(0xff959595),
              //       ),
              //     ),
              //   ),
              // ),
              Container(
                width: 300,
                height: 30,
                alignment: Alignment.centerLeft,
                child: TextField(
                  controller: _password,
                  enableSuggestions: false,
                  autocorrect: false,
                  obscureText: _obscurePassword,
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
                        _obscurePassword ? CustomIcons.eyeOff : CustomIcons.eye,
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
              // Container(
              //   width: 300,
              //   height: 30,
              //   alignment: Alignment.centerLeft,
              //   child: TextField(
              //     controller: _password2,
              //     enableSuggestions: false,
              //     autocorrect: false,
              //     obscureText: _obscurePassword2,
              //     decoration: InputDecoration(
              //       contentPadding: const EdgeInsets.fromLTRB(12, 0, 10, 0),
              //       border: const OutlineInputBorder(
              //         borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //         borderSide: BorderSide(
              //           color: Color(0xffD4D4D4),
              //         ),
              //       ),
              //       hintText: 'Enter password...',
              //       hintStyle: const TextStyle(
              //         color: Color(0xff959595),
              //       ),
              //       suffixIcon: GestureDetector(
              //         child: Icon(
              //           _obscurePassword2
              //               ? CustomIcons.eye_off
              //               : CustomIcons.eye,
              //           color: const Color(0xff666666),
              //           size: 20,
              //         ),
              //         onTap: () {
              //           setState(() {
              //             _obscurePassword2 = !_obscurePassword2;
              //           });
              //         },
              //       ),
              //       suffixIconColor: const Color(0xff666666),
              //     ),
              //   ),
              // ),
              ElevatedButton(
                onPressed: () async {
                  final email = _email.text;
                  final password = _password.text;
                  try {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    CustomWidgets.mySnackBarWidget(
                      context,
                      'A verification code has been sent to the corresponding email.',
                    );
                    final user = FirebaseAuth.instance.currentUser;
                    if (user != null) {
                      if (!user.emailVerified) {
                        await user.sendEmailVerification();
                      }
                    }
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      '/login/',
                      (route) => false,
                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      CustomWidgets.mySnackBarWidget(
                        context,
                        'Password is too weak!',
                      );
                    } else if (e.code == 'email-already-in-use') {
                      CustomWidgets.mySnackBarWidget(
                        context,
                        'There is already an account with that email!',
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
                  'REGISTER',
                  style: TextStyle(
                    color: Color(0xff333333),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff8EB4FF),
                  side: const BorderSide(
                    color: Color(0xffFFAE2D),
                  ),
                  fixedSize: const Size(340.0, 30.0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
