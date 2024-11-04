import 'exceptions.dart';

abstract class DataResult<S> {
  const DataResult();

  S? get data => fold<S?>(
        (error) => null,
        (data) => data,
      );

  Failure? get error => fold<Failure?>(
        (error) => error,
        (data) => null,
      );

  static DataResult<S> failure<S>(Failure failure) => _FailureResult(failure);

  T fold<T>(
    T Function(Failure error) fnFailure,
    T Function(S data) fnData,
  );

  static DataResult<S> success<S>(S data) => _SuccessResult(data);
}

class _FailureResult<S> extends DataResult<S> {
  const _FailureResult(this._value);

  final Failure _value;

  @override
  T fold<T>(
    T Function(Failure error) fnFailure,
    T Function(S data) fnData,
  ) =>
      fnFailure(_value);
}

class _SuccessResult<S> extends DataResult<S> {
  const _SuccessResult(this._value);

  final S _value;

  @override
  T fold<T>(
    T Function(Failure error) fnFailure,
    T Function(S data) fnData,
  ) =>
      fnData(_value);
}
