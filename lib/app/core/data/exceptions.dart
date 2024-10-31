abstract class Failure implements Exception {
  const Failure();

  String get message;

  @override
  String toString() {
    return '$runtimeType Exception';
  }
}

class GeneralException extends Failure {
  const GeneralException();

  @override
  String get message => 'An error has occurred. Please try again later.';
}

class APIException extends Failure {
  const APIException({
    required this.code,
    this.textCode,
  });

  final int code;
  final String? textCode;

  @override
  String get message {
    if (textCode != null) {
      switch (textCode) {
        case 'invalid-headers':
        case 'validation-failed':
          return 'Bad request. Check you request and try again.';
        default:
          return 'An internal error ocurred. Please try again later.';
      }
    }
    switch (code) {
      case 400:
        return 'Bad request. Check you request and try again.';
      case 401:
        return 'User not authorized to access this resource at this time. Please reauthenticate';
      case 404:
        return 'It was not possible to finish this operation. Please try again later';
      case 503:
        return 'Service unavailable at this time. Please try again later.';
      default:
        return 'An internal error ocurred. Please try again later.';
    }
  }
}
