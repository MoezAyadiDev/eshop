import 'package:eshop/commen/localization/l10n.dart';
import 'package:eshop/commen/util/injection/injectable_init.dart';
import 'package:eshop/commen/util/routes/app_router.dart';
import 'package:eshop/features/app/presentation/cubit/session_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EshopApp extends StatelessWidget {
  const EshopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SessionCubit>(),
      child: const AppView(),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     localizationsDelegates: const [
  //       AppLocalizations.delegate,
  //       GlobalMaterialLocalizations.delegate,
  //       GlobalWidgetsLocalizations.delegate,
  //       GlobalCupertinoLocalizations.delegate,
  //     ],
  //     supportedLocales: L10n.all,
  //     // onGenerateTitle: (BuildContext context) =>
  //     //     AppLocalizations.of(context)!.appTitle,
  //     // theme: GalleryThemeData.lightThemeData,
  //     // darkTheme: GalleryThemeData.darkThemeData,
  //     // themeMode: settingsController.themeMode,
  //     // locale: Locale(settingsController.language),
  //     home: SigninPage(),
  //   );
  // }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appRouter = appRourter(context, null);

    return MaterialApp.router(
      routerDelegate: _appRouter.routerDelegate,
      routeInformationParser: _appRouter.routeInformationParser,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.all,
    );
  }
}
