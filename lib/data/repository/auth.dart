import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_login/data/models/signIn_request_params.dart';
import 'package:flutter_bloc_login/data/source/auth_api_services.dart';
import 'package:flutter_bloc_login/domain/repository/auth_repository.dart';
import 'package:flutter_bloc_login/presentation/auth/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signIn(SigninRequestParams signInReq) async {
    return sl<AuthApiServices>().signIn(signInReq);
  }
}
