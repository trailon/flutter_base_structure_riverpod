// ignore_for_file: unused_field

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../app/app_defaults.dart';

@lazySingleton
class ApiService {
  late Dio _dio;

  ApiService() {
    final baseOptions = BaseOptions(
      baseUrl: AppDefaults.kBaseUrl,
      queryParameters: {'api_key': AppDefaults.kApiKey},
    );
    _dio = Dio(baseOptions);
  }
}
