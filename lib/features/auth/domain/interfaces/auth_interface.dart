import 'package:dartz/dartz.dart';
import 'package:eshop/commen/util/exception/auth_failures.dart';
import 'package:eshop/commen/util/exception/signup_failures.dart';
import 'package:eshop/features/auth/domain/entities/utilisateur.dart';

abstract class AuthInterface {
  Stream<Utilisateur?> get user;
  Utilisateur? get currentUser;

  Future<Either<SignUpFailure, bool>> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    throw UnimplementedError();
  }

  Future<bool> signInWithGoogle() async {
    throw UnimplementedError();
  }

  Future<Either<AuthentificationFailure, bool>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    throw UnimplementedError();
  }

  Future<bool> logOut() async {
    throw UnimplementedError();
  }

  Future<bool> mailVerificationPage() async {
    throw UnimplementedError();
  }
}
