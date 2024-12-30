import 'package:dartz/dartz.dart';
import 'package:flutter_login/core/usecase/usecase.dart';
import 'package:flutter_login/data/models/signIn_request_params.dart';
import 'package:flutter_login/domain/repository/auth_repository.dart';
import 'package:flutter_login/presentation/auth/service_locator.dart';

class SignInUseCase implements UseCase<Either, SigninRequestParams> {
  @override
  Future<Either> call({SigninRequestParams? param}) async {
    return sl<AuthRepository>().signIn(param!);
  }
}
