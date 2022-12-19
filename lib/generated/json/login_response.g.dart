import 'package:journal_florist/generated/json/base/json_convert_content.dart';
import 'package:journal_florist/features/login/model/login_response.dart';


LoginResponse $LoginResponseFromJson(Map<String, dynamic> json) {
	final LoginResponse loginResponse = LoginResponse();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		loginResponse.id = id;
	}
	final String? accessToken = jsonConvert.convert<String>(json['accessToken']);
	if (accessToken != null) {
		loginResponse.accessToken = accessToken;
	}
	final String? fullName = jsonConvert.convert<String>(json['fullName']);
	if (fullName != null) {
		loginResponse.fullName = fullName;
	}
	final String? username = jsonConvert.convert<String>(json['username']);
	if (username != null) {
		loginResponse.username = username;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		loginResponse.email = email;
	}
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		loginResponse.type = type;
	}
	final String? joinDate = jsonConvert.convert<String>(json['joinDate']);
	if (joinDate != null) {
		loginResponse.joinDate = joinDate;
	}
	final String? avatar = jsonConvert.convert<String>(json['avatar']);
	if (avatar != null) {
		loginResponse.avatar = avatar;
	}
	final List<String>? roles = jsonConvert.convertListNotNull<String>(json['roles']);
	if (roles != null) {
		loginResponse.roles = roles;
	}
	return loginResponse;
}

Map<String, dynamic> $LoginResponseToJson(LoginResponse entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['accessToken'] = entity.accessToken;
	data['fullName'] = entity.fullName;
	data['username'] = entity.username;
	data['email'] = entity.email;
	data['type'] = entity.type;
	data['joinDate'] = entity.joinDate;
	data['avatar'] = entity.avatar;
	data['roles'] =  entity.roles;
	return data;
}