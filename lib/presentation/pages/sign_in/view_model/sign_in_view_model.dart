import 'package:flutter/material.dart';
import 'package:mvp_provider_boilerplate/data/api/model/social_response_model.dart';
import 'package:mvp_provider_boilerplate/presentation/providers/auth_provider.dart';
import 'package:mvp_provider_boilerplate/presentation/pages/sign_in/type/social_login_type.dart';
import 'package:provider/provider.dart';

class SignInViewModel {
  State state;

  SignInViewModel(this.state);

  /// SNS 로그인
  Future<void> onClickSocialButton(SocialLoginType type) async {
    dynamic result;
    switch (type) {
      case SocialLoginType.kakao:
        result = await kakaoLogin();
        break;
      case SocialLoginType.naver:
        result = await naverLogin();
        break;
      case SocialLoginType.apple:
        result = await appleLogin();
        break;
      case SocialLoginType.google:
        result = await googleLogin();
        break;
    }

    if (result == null) {
      return;
    }

    // 로그인 실행 로직
    final auth = Provider.of<AuthProvider>(state.context, listen: false);
    await auth.postSocialLogin(context: state.context, result: result);
  }

  Future<SocialResponseModel?> kakaoLogin() async {
    // var result = await SocialLoginHelper.signInWithKakao(state.context);
    // return result;
  }

  Future<SocialResponseModel?> naverLogin() async {
    // var result = await SocialLoginHelper.signInWithNaver(state.context);
    // return result;
  }

  Future<SocialResponseModel?> appleLogin() async {
    // var result = await SocialLoginHelper.signInWithApple(state.context);
    // return result;
  }

  Future<SocialResponseModel?> googleLogin() async {
    // var result = await SocialLoginHelper.signInWithGoogle(state.context);
    // return result;
  }
}
