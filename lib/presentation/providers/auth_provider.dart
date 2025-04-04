import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider();

  /// 임시 로직
  Future<void> postSocialLogin(
      {required dynamic result, required BuildContext context}) async {
    debugPrint('$result');
  }
}
