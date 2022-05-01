import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:eshop/commen/util/connectivity/network_info.dart';
import 'package:eshop/commen/util/exception/failures.dart';
import 'package:eshop/commen/util/exception/internet_failures.dart';
import 'package:eshop/commen/util/exception/signup_failures.dart';
import 'package:eshop/features/auth/domain/entities/utilisateur.dart';
import 'package:eshop/features/auth/domain/interfaces/auth_interface.dart';
import 'package:eshop/features/auth/infrastructure/data_sources/appwrite_datasource.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthInterface)
class AuthRepository implements AuthInterface {
  AuthRepository(this.dataSource, this.networkInfo);
  final AppwriteDataSource dataSource;
  final NetworkInfo networkInfo;
  bool isAuthenticated = false;
  Utilisateur? _user;

  final _controller = StreamController<Utilisateur?>.broadcast();

  @override
  Utilisateur? get currentUser => isAuthenticated ? _user : null;

  @override
  Stream<Utilisateur?> get user {
    return _controller.stream.asBroadcastStream(
      onListen: (_) {
        _controller.add(isAuthenticated ? _user : null);
      },
    );
  }

  @override
  Future<bool> logOut() {
    _controller.add(null);
    isAuthenticated = false;
    return Future.value(true);
  }

  @override
  Future<bool> mailVerificationPage() {
    // TODO: implement mailVerificationPage
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, bool>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    if (await networkInfo.isConnected) {
      var _isLoggedIn = await dataSource.signInWithEmailAndPassword(
        email,
        password,
      );
      return _isLoggedIn.fold(
        (l) {
          return Left(l);
        },
        (r) {
          _controller.add(r);
          isAuthenticated = true;

          return const Right(true);
        },
      );
    } else {
      return const Left(
        INTERNET_FAILURE,
      );
    }
  }

  @override
  Future<bool> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Either<SignUpFailure, bool>> signUp(
      {required String email,
      required String password,
      required String name}) async {
    var _isLoggedIn = await dataSource.signUp(
      email,
      password,
      name,
    );
    return _isLoggedIn.fold(
      (l) {
        return Left(l);
      },
      (r) {
        debugPrint(r.toString());
        _controller.add(r);
        isAuthenticated = true;

        return const Right(true);
      },
    );
  }
}
