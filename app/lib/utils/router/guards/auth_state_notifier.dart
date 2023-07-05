import 'package:chupp/services/data_service.dart';
import 'package:flutter/material.dart';

class AuthStateNotifier extends ChangeNotifier {
  static final AuthStateNotifier instance = AuthStateNotifier._();

  AuthStateNotifier._();

  void init() => DataService.authStateChanges.listen((_) => notifyListeners());
}
