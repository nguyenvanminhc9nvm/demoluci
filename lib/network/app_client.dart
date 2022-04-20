import 'package:base_flutter_project/configurations/environments.dart';
import 'package:base_flutter_project/network/dio/dio_client.dart';
import 'package:dio/dio.dart';

/// AppClient
class AppClient extends DioClient {
  AppClient() : super(options: _getDioOptions());

  /// config dio client option
  static BaseOptions _getDioOptions() {
    return BaseOptions(
        baseUrl: Environment.host,
        connectTimeout: Environment.apiTimeout,
        headers: _getAuthenticationHeader());
  }

  ///get HTTP Header
  static Map<String, String> _getAuthenticationHeader() {
    return <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }
}
