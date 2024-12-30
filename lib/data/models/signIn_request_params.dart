// ignore: file_names
class SigninRequestParams {
  final String username;
  final String password;

  SigninRequestParams({required this.username, required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'username': username, 'password': password};
  }
}
