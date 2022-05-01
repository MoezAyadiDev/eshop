import 'package:dartz/dartz.dart';
import 'package:eshop/commen/util/connectivity/network_info.dart';
import 'package:eshop/commen/util/exception/internet_failures.dart';
import 'package:eshop/features/auth/domain/entities/utilisateur.dart';
import 'package:eshop/features/auth/infrastructure/data_sources/appwrite_datasource.dart';
import 'package:eshop/features/auth/infrastructure/repositories/auth_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'auth_repository_test.mocks.dart';

@GenerateMocks([NetworkInfoImpl, AppwriteDataSource])
void main() {
  late MockNetworkInfoImpl networkInfo;
  late MockAppwriteDataSource database;
  late AuthRepository repository;
  setUp(() {
    networkInfo = MockNetworkInfoImpl();
    database = MockAppwriteDataSource();
    repository = AuthRepository(
      database,
      networkInfo,
    );
  });

  group(
    'Internet off',
    () {
      test(
        'Should return InternetFailure whene Network is off',
        () async {
          // arrange
          when(networkInfo.isConnected).thenAnswer((_) async => false);
          // act
          final result = await repository.signInWithEmailAndPassword(
              email: '', password: '');
          // assert
          expect(
            result,
            const Left(
              INTERNET_FAILURE,
            ),
          );
        },
      );
    },
  );
}
