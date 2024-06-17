class BaseApiResponse {
  final String message;
  final bool success;
  final dynamic data;

  BaseApiResponse({
    required this.message,
    required this.success,
    required this.data,
  });
  BaseApiResponse.success({
    this.message = '',
    this.success = true,
    required this.data,
  });
  BaseApiResponse.failure({
    this.message = '',
    this.success = false,
    required this.data,
  });
}
