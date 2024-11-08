enum APIErrorType {
  noConnection,
  timeout,
  notFound,
  invalidData,
  serverError,
  emptyResponse,
  unknown,
}

class APIException extends Failure {
  const APIException({
    required this.code,
    this.errorType = APIErrorType.unknown,
  });

  final int code;
  final APIErrorType errorType;

  @override
  String get message {
    if (errorType != APIErrorType.unknown) {
      switch (errorType) {
        case APIErrorType.noConnection:
          return 'No internet connection. Please check your network';
        case APIErrorType.timeout:
          return 'Connection timeout. Please try again';
        case APIErrorType.notFound:
          return 'Pokemon data not found';
        case APIErrorType.invalidData:
          return 'Invalid Pokemon data format';
        case APIErrorType.serverError:
          return 'Internal server error. Please try again later';
        case APIErrorType.emptyResponse:
          return 'No data received from server';
        case APIErrorType.unknown:
          break;
      }
    }

    switch (code) {
      case 400:
        return 'Bad request. Check your request and try again';
      case 401:
        return 'Unauthorized access. Please login again';
      case 403:
        return 'Access forbidden. You don\'t have permission to access this resource';
      case 404:
        return 'Resource not found';
      case 408:
        return 'Request timeout. Please try again';
      case 500:
        return 'Internal server error. Please try again later';
      case 502:
        return 'Bad gateway. Please try again later';
      case 503:
        return 'Service unavailable. Please try again later';
      case 504:
        return 'Gateway timeout. Please try again later';
      default:
        return 'An unexpected error occurred. Please try again later';
    }
  }
}

abstract class Failure implements Exception {
  const Failure();

  @override
  String toString() {
    return '$runtimeType Exception';
  }

  String get message;
}

class GeneralException extends Failure {
  const GeneralException();

  @override
  String get message => 'An error has occurred. Please try again later.';
}
