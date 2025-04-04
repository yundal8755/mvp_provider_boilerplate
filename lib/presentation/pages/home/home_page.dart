import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mvp_provider_boilerplate/app/router/routes.dart';
import 'package:mvp_provider_boilerplate/presentation/components/button/cool_button.dart';
import 'package:mvp_provider_boilerplate/presentation/pages/home/home_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = HomeViewModel(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // KAKAO
              CoolButton(
                onPressed: () => context.push(AppRoute.signIn.path),
                child: const Text('SNS 로그인 하러가기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
