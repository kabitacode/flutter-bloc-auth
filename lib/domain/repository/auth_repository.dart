import 'package:dartz/dartz.dart';
import 'package:flutter_login/data/models/signIn_request_params.dart';

abstract class AuthRepository {
  Future<Either> signIn(SigninRequestParams signInReq);
}
