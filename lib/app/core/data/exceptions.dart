class APIException extends Failure {
  const APIException({
    required this.code,
    this.textCode,
  });

  final int code;
  final String? textCode;

  @override
  String get message =>
      textCode ?? 'An error has occurred. Please try again later.';
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
