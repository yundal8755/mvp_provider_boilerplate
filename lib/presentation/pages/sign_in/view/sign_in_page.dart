import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:mvp_provider_boilerplate/app/constant/assets.dart';
import 'package:mvp_provider_boilerplate/app/style/app_color.dart';
import 'package:mvp_provider_boilerplate/presentation/widgets/icon_text_button.dart';
import 'package:mvp_provider_boilerplate/presentation/pages/sign_in/type/social_login_type.dart';
import 'package:mvp_provider_boilerplate/presentation/pages/sign_in/view_model/sign_in_view_model.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late SignInViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = SignInViewModel(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // KAKAO
              IconTextButton(
                text: '카카오로 시작하기',
                onPressed: () =>
                    viewModel.onClickSocialButton(SocialLoginType.kakao),
                leading: SvgPicture.asset(AppAsset.kakaoLogo),
                backgroundColor: AppColor.kakao,
                foregroundColor: AppColor.black,
              ),

              const Gap(16),

              // NAVER
              IconTextButton(
                text: '네이버로 시작하기',
                onPressed: () =>
                    viewModel.onClickSocialButton(SocialLoginType.naver),
                leading: SvgPicture.asset(AppAsset.naverLogo),
                backgroundColor: AppColor.naver,
                foregroundColor: AppColor.white,
              ),

              const Gap(16),

              // GOOGLE
              IconTextButton(
                text: 'Google로 시작하기',
                onPressed: () =>
                    viewModel.onClickSocialButton(SocialLoginType.google),
                leading: SvgPicture.asset(AppAsset.googleLogo),
                backgroundColor: AppColor.white,
                foregroundColor: AppColor.black,
                borderColor: AppColor.gray050,
              ),

              const Gap(16),

              // APPLE
              IconTextButton(
                text: 'Apple로 시작하기',
                onPressed: () =>
                    viewModel.onClickSocialButton(SocialLoginType.apple),
                leading: SvgPicture.asset(AppAsset.appleLogo,
                    colorFilter: const ColorFilter.mode(
                        AppColor.black, BlendMode.srcIn)),
                backgroundColor: AppColor.white,
                foregroundColor: AppColor.black,
                borderColor: AppColor.gray050,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
