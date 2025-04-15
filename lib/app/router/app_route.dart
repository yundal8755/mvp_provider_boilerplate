import 'package:go_router/go_router.dart';
import 'package:mvp_provider_boilerplate/presentation/pages/sign_in/view/sign_in_page.dart';
import 'package:mvp_provider_boilerplate/presentation/pages/entry/root_page.dart';
import 'package:mvp_provider_boilerplate/presentation/pages/home/home_page.dart';

enum AppRoute {
  home('/home'),
  signIn('/signIn');

  const AppRoute(this.path);

  final String path;
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const RootPage(),
    ),
    GoRoute(
      path: AppRoute.home.path,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: AppRoute.signIn.path,
      builder: (context, state) => const SignInPage(),
    ),
  ],
);
