import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_provider_boilerplate/app/router/routes.dart';
import 'package:mvp_provider_boilerplate/app/style/app_size.dart';
import 'package:mvp_provider_boilerplate/app/style/app_theme.dart';
import 'package:mvp_provider_boilerplate/presentation/providers/auth_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: AppSize.verticalMode,
        child: MaterialApp.router(
          title: 'MVP_Provider_Boilerplate',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          // darkTheme: AppTheme.dark,
          themeMode: ThemeMode.light, // 폰 설정에 따라 제어하려면 .system으로 변경
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          routeInformationProvider: router.routeInformationProvider,
        ),
      ),
    );
  }
}
