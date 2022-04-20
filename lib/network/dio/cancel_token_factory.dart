import 'package:dio/dio.dart';

class CancelTokenFactory {
  CancelToken? _cancelToken;

  static final CancelTokenFactory _factory = CancelTokenFactory._internal();

  CancelTokenFactory._internal();

  factory CancelTokenFactory() => _factory;

  get cancelToken {
    if (_cancelToken == null) {
      _cancelToken = CancelToken();
    }
    return _cancelToken;
  }

  void clear() {
    _cancelToken = null;
  }
}
