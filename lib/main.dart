import 'package:flutter/material.dart';
import 'package:mvp_provider_boilerplate/app/style/app_theme.dart';
import 'package:mvp_provider_boilerplate/feature/home/presentation/view/home_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVP_Provider_Boilerplate',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      // darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light, // 폰 설정에 따라 제어하려면 .system으로 변경
      home: const HomePage(),
    );
  }
}
