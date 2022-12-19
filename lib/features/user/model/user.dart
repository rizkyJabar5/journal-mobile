import 'package:journal_florist/generated/json/base/json_field.dart';
import 'package:journal_florist/generated/json/users_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class UsersEntity {

  late int userId;
  late String email;
  late String username;
  late String fullName;
  late String joinDate;
  late String profileAvatar;
  late bool accountNonExpired;
  late bool accountNonLocked;
  late bool credentialsNonExpired;
  late bool enabled;
  late List<UsersAuthorities> authorities;

  UsersEntity();

  factory UsersEntity.fromJson(Map<String, dynamic> json) => $UsersEntityFromJson(json);

  Map<String, dynamic> toJson() => $UsersEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UsersAuthorities {

  late String authority;

  UsersAuthorities();

  factory UsersAuthorities.fromJson(Map<String, dynamic> json) => $UsersAuthoritiesFromJson(json);

  Map<String, dynamic> toJson() => $UsersAuthoritiesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}