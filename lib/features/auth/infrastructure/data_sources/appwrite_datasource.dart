import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:appwrite/appwrite.dart';
import 'package:eshop/commen/util/exception/auth_failures.dart';
import 'package:eshop/commen/util/exception/signup_failures.dart';
import 'package:eshop/features/auth/domain/entities/utilisateur.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class AppwriteDataSource {
  late Client _client;
  AppwriteDataSource() {
    debugPrint('AppwriteDataSource');
    _client = Client();
    _client
        .setEndpoint('http://172.20.11.4/v1') // Your Appwrite Endpoint
        .setProject('62672942734c1f94397d') // Your project ID
        .setSelfSigned(status: true);
  }

  Future<Either<AuthentificationFailure, Utilisateur>>
      signInWithEmailAndPassword(String email, String password) async {
    try {
      Account _account = Account(_client);
      Session _session = await _account.createSession(
        email: email,
        password: password,
      );
      return Right(
        Utilisateur(_session.userId, _session.clientName, _session.providerUid),
      );
    } on AppwriteException catch (e) {
      return Left(
        AuthentificationFailure(
          error: e.code,
          message: e.message,
        ),
      );
    }
  }

  Future<Either<SignUpFailure, Utilisateur>> signUp(
    String email,
    String password,
    String name,
  ) async {
    try {
      debugPrint('signUp 1 ');
      Account account = Account(_client);
      debugPrint('signUp 2');
      var _user = await account.create(
        userId: 'unique()',
        email: email,
        password: password,
        name: name,
      );
      var promise =
          await account.createMagicURLSession(userId: _user.$id, email: email);
      // Token result = await account.createVerification(
      //   url: 'https://localhost/callback-page',
      // );
      debugPrint(promise.toString());
      debugPrint(_user.toMap().toString());
      return Right(Utilisateur.fromJson(_user.toMap()));
    } on AppwriteException catch (e) {
      debugPrint('signUp error ' + e.toString());
      return Left(SignUpFailure(
        error: e.code,
        message: e.message,
      ));
    }
  }
}
