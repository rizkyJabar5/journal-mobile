import 'package:json_annotation/json_annotation.dart';

part 'error_response.g.dart';

@JsonSerializable()
class ErrorResponse {
  String? path;
  String? message;
  String? error;
  String? timestamp;
  int? status;

  ErrorResponse(
    this.path,
    this.message,
    this.error,
    this.timestamp,
    this.status,
  );

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
}
