import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalService {
  Future<bool> isSignIn();
}

class AuthLocalServiceImpl extends AuthLocalService {
  @override
  Future<bool> isSignIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }
}
