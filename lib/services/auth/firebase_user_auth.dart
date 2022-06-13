import 'package:flutter/material.dart';
import 'package:groceries_n_you/services/auth/auth_service.dart';

import '../crud/initialize_products.dart';

class MyFirebaseUserAuth extends StatelessWidget {
  const MyFirebaseUserAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return const InitDbProducts();
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
