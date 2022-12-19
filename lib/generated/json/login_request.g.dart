import 'package:journal_florist/generated/json/base/json_convert_content.dart';
import 'package:journal_florist/features/login/model/login_request.dart';

LoginRequest $LoginRequestFromJson(Map<String, dynamic> json) {
	final LoginRequest loginRequest = LoginRequest();
	final String? username = jsonConvert.convert<String>(json['username']);
	if (username != null) {
		loginRequest.username = username;
	}
	final String? password = jsonConvert.convert<String>(json['password']);
	if (password != null) {
		loginRequest.password = password;
	}
	return loginRequest;
}

Map<String, dynamic> $LoginRequestToJson(LoginRequest entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['username'] = entity.username;
	data['password'] = entity.password;
	return data;
}