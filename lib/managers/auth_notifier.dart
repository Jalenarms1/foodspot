import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:foodspot/models/local_auth.dart';
import 'package:foodspot/models/user.dart';
import 'package:foodspot/managers/network_manager.dart';

class AuthNotifier extends ChangeNotifier {
  bool isLoggedIn = false;
  bool isGuest = false;
  User? currUser;

  AuthNotifier() {
    print("hello");
    getUser();
    // LocalAuth.removeToken();
  }

  Future<void> getUser() async {
    final resp = await NetworkManager.get("/api/users/me");

    print(resp.statusCode);

    if (resp.statusCode != 200) {
      return;
    }
    print(resp.body);
    currUser = User.fromJson(jsonDecode(resp.body));
    if (currUser?.isVerified ?? false) {
      isLoggedIn = true;
    }
    notifyListeners();
  }

  void continueAsGuest() {
    isGuest = true;
    notifyListeners();
  }
}
