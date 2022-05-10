import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_app/myWidgets/my_header.dart';
import 'dart:math' as math;

import '../customIcons/custom_icons_icons.dart';
import '../myWidgets/my_app_bar.dart';

class ProfileRegister extends StatefulWidget {
  const ProfileRegister({Key? key}) : super(key: key);

  @override
  State<ProfileRegister> createState() => _ProfileRegisterPageState();
}

class _ProfileRegisterPageState extends State<ProfileRegister> {
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
      appBar: MyAppBar(),
      body: Stack(
        children: [
          Column(
            children: [
              MyHeaderWidget(
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
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                            ? CustomIcons.eye_off
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
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text(
                        'A verification code has been sent to the corresponding email.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff333333),
                        ),
                      ),
                      backgroundColor: const Color(0xffFFBE57),
                      duration: const Duration(milliseconds: 2000),
                      behavior: SnackBarBehavior.floating,
                      width: 200.0,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Color(0xff699BFF),
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ));
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text(
                          'Password is too weak!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff333333),
                          ),
                        ),
                        backgroundColor: const Color(0xffFFBE57),
                        duration: const Duration(milliseconds: 2000),
                        behavior: SnackBarBehavior.floating,
                        width: 200.0,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Color(0xff699BFF),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ));
                    } else if (e.code == 'email-already-in-use') {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text(
                          'There is already an account with that email!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff333333),
                          ),
                        ),
                        backgroundColor: const Color(0xffFFBE57),
                        duration: const Duration(milliseconds: 2000),
                        behavior: SnackBarBehavior.floating,
                        width: 200.0,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Color(0xff699BFF),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ));
                    } else if (e.code == 'invalid-email') {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text(
                          'Invalid email!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff333333),
                          ),
                        ),
                        backgroundColor: const Color(0xffFFBE57),
                        duration: const Duration(milliseconds: 2000),
                        behavior: SnackBarBehavior.floating,
                        width: 200.0,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Color(0xff699BFF),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ));
                    }
                  }
                },
                child: const Text(
                  'REGISTER',
                  style: TextStyle(color: Color(0xff333333)),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff8EB4FF),
                  side: const BorderSide(color: Color(0xffFFAE2D)),
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
