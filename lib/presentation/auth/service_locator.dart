import 'package:flutter_login/core/network/dio_client.dart';
import 'package:flutter_login/data/repository/auth.dart';
import 'package:flutter_login/data/source/auth_api_services.dart';
import 'package:flutter_login/domain/repository/auth_repository.dart';
import 'package:flutter_login/domain/usecases/signIn.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // Services
  sl.registerSingleton<AuthApiServices>(AuthApiServiceImpl());

  // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // Usecase
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
}
