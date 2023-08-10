import 'package:flutter/material.dart';

class AuthStateNotifier extends ChangeNotifier {
  static final AuthStateNotifier instance = AuthStateNotifier._();

  AuthStateNotifier._();

  void init() {}
  // void init() => DataService.authStateChanges.listen((_) => notifyListeners());
}
