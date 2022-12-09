class APIResponse<T> {
  int? httpStatus;
  String? message;
  T? data;
  bool? error;
  String? errorMessage;

  APIResponse({
    this.httpStatus,
    this.message,
    this.data,
    this.error,
    this.errorMessage,
  });
}
