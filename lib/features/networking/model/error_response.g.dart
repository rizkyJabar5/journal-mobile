// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) =>
    ErrorResponse(
      json['path'] as String?,
      json['message'] as String?,
      json['error'] as String?,
      json['timestamp'] as String?,
      json['status'] as int?,
    );

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) =>
    <String, dynamic>{
      'path': instance.path,
      'message': instance.message,
      'error': instance.error,
      'timestamp': instance.timestamp,
      'status': instance.status,
    };
