import 'package:eshop/commen/util/injection/injectable_init.dart';
import 'package:eshop/features/auth/presentation/bloc/signin/login_cubit.dart';
import 'package:eshop/features/auth/presentation/ui/widgets/signin/signin_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentification'),
      ),
      body: BlocProvider(
        create: (context) => getIt<LoginCubit>(),
        child: const SignInBody(),
      ),
    );
  }
}
