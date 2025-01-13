import 'package:flutter_bloc_login/core/usecase/usecase.dart';
import 'package:flutter_bloc_login/domain/repository/auth_repository_domain.dart';
import 'package:flutter_bloc_login/presentation/auth/service_locator.dart';

class IsSignIn implements UseCase<bool, dynamic> {
  @override
  Future<bool> call({dynamic param}) async {
    return sl<AuthRepository>().isSignIn();
  }
}
