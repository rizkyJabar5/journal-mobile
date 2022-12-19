import 'dart:async';

import 'package:journal_florist/features/user/model/user.dart';

import '../../networking/api_interceptor.dart';
import '../../networking/endpoints.dart';
import '../../networking/token_repository.dart';


class UserRepository {
  late final TokenRepository tokenRepository;

  final APIInterceptors api = APIInterceptors();
  UsersEntity? _user;

  Future<UsersEntity?> getUserById(int userId) async {
    try {
      final user = await api.getRequest("${Endpoints.user}/user/${userId}");
      _user = UsersEntity.fromJson(user.data);
    } catch (e) {}

    return _user;
  }
}
