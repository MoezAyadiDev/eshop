// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../features/app/presentation/cubit/session_cubit.dart' as _i9;
import '../../../features/auth/application/services/auth_service.dart' as _i7;
import '../../../features/auth/domain/interfaces/auth_interface.dart' as _i5;
import '../../../features/auth/infrastructure/data_sources/appwrite_datasource.dart'
    as _i3;
import '../../../features/auth/infrastructure/repositories/auth_repository.dart'
    as _i6;
import '../../../features/auth/presentation/bloc/signin/login_cubit.dart'
    as _i8;
import '../connectivity/network_info.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.AppwriteDataSource>(_i3.AppwriteDataSource());
  gh.singleton<_i4.NetworkInfo>(_i4.NetworkInfoImpl());
  gh.singleton<_i5.AuthInterface>(_i6.AuthRepository(
      get<_i3.AppwriteDataSource>(), get<_i4.NetworkInfo>()));
  gh.singleton<_i7.AuthService>(_i7.AuthService(get<_i5.AuthInterface>()));
  gh.factory<_i8.LoginCubit>(() => _i8.LoginCubit(get<_i7.AuthService>()));
  gh.singleton<_i9.SessionCubit>(_i9.SessionCubit(get<_i5.AuthInterface>()));
  return get;
}
