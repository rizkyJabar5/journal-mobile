import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable(createToJson: false)
class LoginResponse {
  int? id;
  String? accessToken;
  String? fullName;
  String? username;
  String? email;
  String? type;
  String? joinDate;
  String? avatar;
  List<String>? roles;

  LoginResponse({
    this.id,
    this.accessToken,
    this.fullName,
    this.username,
    this.email,
    this.type,
    this.joinDate,
    this.avatar,
    this.roles,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
