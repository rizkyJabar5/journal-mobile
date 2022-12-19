import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';

class TokenRepository {
  final storage = FlutterSecureStorage();

  Future<void> setUserToken({required String accessToken}) async {
    await storage.write(key: "journal", value: accessToken);
  }

  Future<String> getUserToken() async {
    String? accessToken = await storage.read(key: "journal");
    if (accessToken != null && !tokenHasExpired(accessToken)) {
      return accessToken;
    }

    return Future(() => '');
  }

  Future<bool> hasToken() async {
    final accessToken = await storage.read(key: "journal");

    return accessToken != null ? true : false;
  }

  bool tokenHasExpired(String? accessToken) {
    if (accessToken == null) return true;

    return Jwt.isExpired(accessToken);
  }
}
