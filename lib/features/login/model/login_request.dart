import 'package:json_annotation/json_annotation.dart';

import '../../../generated/json/login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  String? username;
  String? password;

  LoginRequest({
    this.username,
    this.password,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) => $LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => $LoginRequestToJson(this);
}
