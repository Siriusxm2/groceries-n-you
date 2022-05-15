import 'package:flutter/material.dart';
import 'package:groceries_n_you/custom_widget_functions.dart';
import 'package:groceries_n_you/dimensions.dart';
import 'package:groceries_n_you/myWidgets/my_bottom_navbar.dart';
import 'package:groceries_n_you/myWidgets/my_drawer.dart';
import 'package:groceries_n_you/myWidgets/my_floating_button.dart';
import 'package:groceries_n_you/myWidgets/my_header.dart';
import 'package:groceries_n_you/constants/routes.dart';
import 'package:groceries_n_you/customIcons/custom_icons_icons.dart';
import 'package:groceries_n_you/myWidgets/my_app_bar.dart';
import 'package:groceries_n_you/services/auth/auth_exceptions.dart';
import 'package:groceries_n_you/services/auth/auth_service.dart';

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
        child: Column(
          children: [
            const MyHeaderWidget(text: 'Register an account'),
            Container(
              width: Dimensions.width300,
              height: Dimensions.height30,
              margin: EdgeInsets.fromLTRB(
                0,
                Dimensions.height10,
                0,
                Dimensions.height5,
              ),
              child: TextField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(
                    Dimensions.width12,
                    0,
                    Dimensions.width10,
                    0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(Dimensions.border10),
                    ),
                    borderSide: const BorderSide(color: Color(0xffD4D4D4)),
                  ),
                  hintText: 'Enter email...',
                  hintStyle: const TextStyle(color: Color(0xff959595)),
                ),
              ),
            ),
            Container(
              width: Dimensions.width300,
              height: Dimensions.height30,
              margin: EdgeInsets.fromLTRB(
                0,
                Dimensions.height5,
                0,
                Dimensions.height10,
              ),
              child: TextField(
                controller: _password,
                enableSuggestions: false,
                autocorrect: false,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(
                    Dimensions.width12,
                    0,
                    Dimensions.width10,
                    0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(Dimensions.border10),
                    ),
                    borderSide: const BorderSide(color: Color(0xffD4D4D4)),
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
            Column(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final email = _email.text;
                    final password = _password.text;
                    try {
                      await AuthService.firebase().createUser(
                        email: email,
                        password: password,
                      );
                      await AuthService.firebase().sendEmailVerification();
                      await CustomWidgets.mySnackBarWidget(
                        context,
                        'Verification email sent!',
                      );
                      Navigator.of(context).pushNamed(verifyRoute);
                    } on WeakPasswordAuthException {
                      await CustomWidgets.showErrorDialog(
                        context,
                        'Password is too weak!',
                      );
                    } on EmailAlreadyInUseAuthException {
                      await CustomWidgets.showErrorDialog(
                        context,
                        'There is already an account with that email!',
                      );
                    } on InvalidEmailAuthException {
                      await CustomWidgets.showErrorDialog(
                        context,
                        'Invalid email!',
                      );
                    } on GenericAuthException {
                      CustomWidgets.showErrorDialog(
                        context,
                        'Authentication error',
                      );
                    }
                  },
                  child: const Text(
                    'REGISTER',
                    style: TextStyle(
                      color: Color(0xff333333),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Dimensions.border10),
                    ),
                    primary: const Color(0xff8EB4FF),
                    side: const BorderSide(
                      color: Color(0xffFFAE2D),
                    ),
                    fixedSize: Size(Dimensions.width340, Dimensions.height30),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: Dimensions.width340,
                    padding: EdgeInsets.only(left: Dimensions.width10),
                    child: Text(
                      'Already have a profile? Login here.',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: const Color(0xff333333),
                        fontSize: Dimensions.font10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: const MyDrawer(),
      floatingActionButton: const MyFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: const MyBottomNavbar(),
    );
  }
}
