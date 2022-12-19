import 'package:journal_florist/generated/json/base/json_convert_content.dart';

import '../../features/user/model/user.dart';

UsersEntity $UsersEntityFromJson(Map<String, dynamic> json) {
	final UsersEntity usersEntity = UsersEntity();
	final int? userId = jsonConvert.convert<int>(json['userId']);
	if (userId != null) {
		usersEntity.userId = userId;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		usersEntity.email = email;
	}
	final String? username = jsonConvert.convert<String>(json['username']);
	if (username != null) {
		usersEntity.username = username;
	}
	final String? fullName = jsonConvert.convert<String>(json['fullName']);
	if (fullName != null) {
		usersEntity.fullName = fullName;
	}
	final String? joinDate = jsonConvert.convert<String>(json['joinDate']);
	if (joinDate != null) {
		usersEntity.joinDate = joinDate;
	}
	final String? profileAvatar = jsonConvert.convert<String>(json['profileAvatar']);
	if (profileAvatar != null) {
		usersEntity.profileAvatar = profileAvatar;
	}
	final bool? accountNonExpired = jsonConvert.convert<bool>(json['accountNonExpired']);
	if (accountNonExpired != null) {
		usersEntity.accountNonExpired = accountNonExpired;
	}
	final bool? accountNonLocked = jsonConvert.convert<bool>(json['accountNonLocked']);
	if (accountNonLocked != null) {
		usersEntity.accountNonLocked = accountNonLocked;
	}
	final bool? credentialsNonExpired = jsonConvert.convert<bool>(json['credentialsNonExpired']);
	if (credentialsNonExpired != null) {
		usersEntity.credentialsNonExpired = credentialsNonExpired;
	}
	final bool? enabled = jsonConvert.convert<bool>(json['enabled']);
	if (enabled != null) {
		usersEntity.enabled = enabled;
	}
	final List<UsersAuthorities>? authorities = jsonConvert.convertListNotNull<UsersAuthorities>(json['authorities']);
	if (authorities != null) {
		usersEntity.authorities = authorities;
	}
	return usersEntity;
}

Map<String, dynamic> $UsersEntityToJson(UsersEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['userId'] = entity.userId;
	data['email'] = entity.email;
	data['username'] = entity.username;
	data['fullName'] = entity.fullName;
	data['joinDate'] = entity.joinDate;
	data['profileAvatar'] = entity.profileAvatar;
	data['accountNonExpired'] = entity.accountNonExpired;
	data['accountNonLocked'] = entity.accountNonLocked;
	data['credentialsNonExpired'] = entity.credentialsNonExpired;
	data['enabled'] = entity.enabled;
	data['authorities'] =  entity.authorities.map((v) => v.toJson()).toList();
	return data;
}

UsersAuthorities $UsersAuthoritiesFromJson(Map<String, dynamic> json) {
	final UsersAuthorities usersAuthorities = UsersAuthorities();
	final String? authority = jsonConvert.convert<String>(json['authority']);
	if (authority != null) {
		usersAuthorities.authority = authority;
	}
	return usersAuthorities;
}

Map<String, dynamic> $UsersAuthoritiesToJson(UsersAuthorities entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['authority'] = entity.authority;
	return data;
}