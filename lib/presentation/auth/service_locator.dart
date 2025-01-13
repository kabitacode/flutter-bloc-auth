import 'package:flutter_bloc_login/core/network/dio_client.dart';
import 'package:flutter_bloc_login/data/repository/auth_repository_data.dart';
import 'package:flutter_bloc_login/data/source/auth_api_services.dart';
import 'package:flutter_bloc_login/data/source/auth_local_service.dart';
import 'package:flutter_bloc_login/domain/repository/auth_repository_domain.dart';
import 'package:flutter_bloc_login/domain/usecases/signIn.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // Services
  sl.registerSingleton<AuthApiServices>(AuthApiServiceImpl());
  sl.registerSingleton<AuthLocalService>(AuthLocalServiceImpl());

  // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // Usecase
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
}
