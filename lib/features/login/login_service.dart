import 'package:journal_florist/features/networking/api_interceptor.dart';
import 'package:journal_florist/features/login/model/login_request.dart';
import 'package:journal_florist/features/networking/token_repository.dart';

import '../networking/endpoints.dart';
import 'model/login_response.dart';

class LoginService {
  TokenRepository tokenRepository = TokenRepository();
  late APIInterceptors api = APIInterceptors();
  Duration get loginTime => Duration(milliseconds: 1);

  Future<LoginResponse?> postLogin(username, password) async {
    final response = await api.postRequest(
        Endpoints.login,
        LoginRequest(
          username: username,
          password: password,
        ));

    if (response.statusCode == 200) {
      tokenRepository.setUserToken(accessToken: response.data['accessToken']);
      print(tokenRepository.getUserToken().toString());

      return LoginResponse.fromJson(response.data);
    }

    return response.data;
  }
}
