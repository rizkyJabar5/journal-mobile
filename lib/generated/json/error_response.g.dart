import 'package:journal_florist/generated/json/base/json_convert_content.dart';
import 'package:journal_florist/features/networking/model/error_response.dart';

ErrorResponse $ErrorResponseFromJson(Map<String, dynamic> json) {
	final ErrorResponse errorResponse = ErrorResponse();
	final String? path = jsonConvert.convert<String>(json['path']);
	if (path != null) {
		errorResponse.path = path;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		errorResponse.message = message;
	}
	final String? error = jsonConvert.convert<String>(json['error']);
	if (error != null) {
		errorResponse.error = error;
	}
	final String? timestamp = jsonConvert.convert<String>(json['timestamp']);
	if (timestamp != null) {
		errorResponse.timestamp = timestamp;
	}
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		errorResponse.status = status;
	}
	return errorResponse;
}

Map<String, dynamic> $ErrorResponseToJson(ErrorResponse entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['path'] = entity.path;
	data['message'] = entity.message;
	data['error'] = entity.error;
	data['timestamp'] = entity.timestamp;
	data['status'] = entity.status;
	return data;
}