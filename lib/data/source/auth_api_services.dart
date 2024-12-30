import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_login/core/constants/api_url.dart';
import 'package:flutter_login/core/network/dio_client.dart';
import 'package:flutter_login/data/models/signIn_request_params.dart';
import 'package:flutter_login/presentation/auth/service_locator.dart';

abstract class AuthApiServices {
  Future<Either> signIn(SigninRequestParams signInReq);
}

class AuthApiServiceImpl extends AuthApiServices {
  @override
  Future<Either> signIn(SigninRequestParams signInReq) async {
    try {
      var response =
          await sl<DioClient>().post(ApiUrl.login, data: signInReq.toMap());
      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
