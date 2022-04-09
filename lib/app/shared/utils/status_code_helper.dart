class StatusCodeHelper {
  static const int statusCodeOK = 200;
  static const int statusCodeCreated = 201;
  static const int statusCodeAccepted = 202;
  static const int statusCodeNoContent = 204;
  static const int statusCodeBadRequest = 400;
  static const int statusCodeUnauthorized = 401;
  static const int statusCodeForbidden = 403;
  static const int statusCodeNotFound = 404;

  static bool isSuccess(int? statusCode) {
    return statusCode == statusCodeOK ||
        statusCode == statusCodeCreated ||
        statusCode == statusCodeAccepted ||
        statusCode == statusCodeNoContent;
  }

  static bool isError(int? statusCode) {
    return statusCode == statusCodeBadRequest ||
        statusCode == statusCodeUnauthorized ||
        statusCode == statusCodeForbidden ||
        statusCode == statusCodeNotFound;
  }
}
