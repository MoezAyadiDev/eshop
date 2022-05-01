import 'package:dartz/dartz.dart';
import 'package:eshop/commen/util/exception/failures.dart';
import 'package:eshop/commen/util/exception/signup_failures.dart';
import 'package:eshop/features/auth/domain/interfaces/auth_interface.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class AuthService {
  AuthService(this._authService);
  final AuthInterface _authService;

  Future<Either<Failures, bool>> signInWithEmailAndPassword(
      String email, String password) async {
    return _authService.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<Either<SignUpFailure, bool>> signUp(
      String email, String password, String name) async {
    return _authService.signUp(
      email: email,
      password: password,
      name: name,
    );
  }

  Future<bool> mailVerification(String email, String password) async {
    return _authService.mailVerificationPage();
  }
}
