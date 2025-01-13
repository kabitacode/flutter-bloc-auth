import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc_login/data/models/signIn_request_params.dart';
import 'package:flutter_bloc_login/data/source/auth_api_services.dart';
import 'package:flutter_bloc_login/data/source/auth_local_service.dart';
import 'package:flutter_bloc_login/domain/repository/auth_repository_domain.dart';
import 'package:flutter_bloc_login/presentation/auth/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signIn(SigninRequestParams signInReq) async {
    Either result = await sl<AuthApiServiceImpl>().signIn(signInReq);

    return result.fold((error) {
      return Left(error);
    }, (data) async {
      Response response = data;
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("token", response.data['accessToken']);
      return Right(response);
    });
  }

  @override
  Future<bool> isSignIn() {
    return sl<AuthLocalService>().isSignIn();
  }
}
