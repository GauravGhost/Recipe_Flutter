import 'package:dio/dio.dart';
import 'package:myapp/utils/const.dart';

class HttpService {
  static final HttpService _singleton = HttpService._internal();
  final _dio = Dio();
  factory HttpService() {
    return _singleton;
  }
  HttpService._internal();
  Future<void> setup({String? bearerToken}) async {
    final headers = {
      'Content-Type': 'application/json',
    };
    final options = BaseOptions(
      headers: headers,
      baseUrl: API_BASE_URL,
      validateStatus: (status) {
        if (status == null) return false;
        return status < 500;
      },
    );

    _dio.options = options;
  }
}
