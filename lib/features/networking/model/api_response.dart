class APIResponse<T> {
  int? httpStatus;
  String message;
  T? data;

  APIResponse(
    this.httpStatus,
    this.message,
    this.data,
  );

  APIResponse.fromJson(Map<String, dynamic> json)
      : httpStatus = json['httpStatus'],
        message = json['httpStatus'],
        data = json['data'];
}
