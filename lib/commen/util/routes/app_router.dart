import 'package:eshop/features/app/presentation/cubit/session_cubit.dart';
import 'package:eshop/features/auth/presentation/ui/signin_page.dart';
import 'package:eshop/features/auth/presentation/ui/signup_page.dart';
import 'package:eshop/features/eshop/presentation/ui/eshop_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

GoRouter appRourter(BuildContext context, String? initialLocation) => GoRouter(
      initialLocation: initialLocation ?? Routes.splashPath,
      debugLogDiagnostics: true,
      urlPathStrategy: UrlPathStrategy.path,
      refreshListenable:
          GoRouterRefreshStream(context.read<SessionCubit>().stream),
      routes: [
        GoRoute(
          name: Routes.loginName,
          path: Routes.loginPath,
          builder: (context, state) {
            return const SignInPage();
          },
          routes: [
            GoRoute(
              path: Routes.signupPath,
              name: Routes.signupName,
              builder: (context, state) {
                return const SignUpPage();
              },
            ),
          ],
        ),
        GoRoute(
          name: Routes.homeName,
          path: Routes.homePath,
          builder: (context, state) {
            return const EShopPage();
          },
        ),
      ],
      redirect: (state) {
        final loggedIn = context.read<SessionCubit>().state.isAuthenticated;
        final loggingIn = state.subloc == Routes.loginPath;
        final signingUp = state.subloc == '/login/' + Routes.signupPath;
        if (signingUp && !loggedIn) {
          return null;
        }

        if (!loggedIn) {
          return loggingIn ? null : Routes.loginPath;
        }
        if (loggingIn || (signingUp && loggedIn)) {
          return Routes.homePath;
        }

        return null;
      },
    );

class Routes {
  static const loginPath = '/login';
  static const homePath = '/home';
  static const splashPath = '/';
  static const signupPath = 'signup';
  static const mailVerificationPath = 'mailVerification';

  static const loginName = 'login';
  static const homeName = 'home';
  static const splashName = 'splash';
  static const signupName = 'signup';
  static const mailVerificationName = 'mailVerification';
}
