import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/foundation.dart';

@immutable
class AuthUser {
  final String? email;
  final String? displayName;
  final bool isEmailVerified;

  const AuthUser({
    required this.email,
    required this.displayName,
    required this.isEmailVerified,
  });

  factory AuthUser.fromFirebase(User user) => AuthUser(
        email: user.email,
        displayName: user.displayName,
        isEmailVerified: user.emailVerified,
      );
}
