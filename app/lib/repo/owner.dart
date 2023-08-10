import 'package:chupp/models/profile/owner_profile.dart';
import 'package:chupp/services/data_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OwnerProvider extends ChangeNotifier {
  OwnerProfile? profile;

  static bool _registered = false;

  static bool get isRegistered => _registered;

  OwnerProvider();

  Future<void> getOwner() async {
    profile = await DataService.getCurrentUser();
    _registered = profile != null;
    notifyListeners();
  }
}

final ChangeNotifierProvider<OwnerProvider> ownerProvider =
    ChangeNotifierProvider((ref) => OwnerProvider());
