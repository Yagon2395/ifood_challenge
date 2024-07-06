import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

enum Level { debug, success, error }

void logDebug(String message, {Level level = Level.debug}) {
  const String stopColor = '\x1B[0m';
  const String redColor = '\x1B[31m';
  const String greenColor = '\x1B[32m';
  const String cyanColor = '\x1B[36m';

  final now = DateTime.now();
  final timeString =
      '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';

  if (kDebugMode) {
    try {
      String logMessage;
      switch (level) {
        case Level.debug:
          logMessage = '$cyanColor[DEBUG][$timeString] $message$stopColor';
          break;
        case Level.success:
          logMessage = '$greenColor[DEBUG][$timeString] $message$stopColor';
          break;
        case Level.error:
          logMessage = '$redColor[DEBUG][$timeString] $message$stopColor';
          break;
      }
      log(logMessage);
    } catch (e) {
      print(e.toString());
    }
  }
}

class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl}${options.path}';

    logDebug('onRequest ${options.method} request => $requestPath');
    logDebug(
        'onRequest ${options.method} Request headers => ${_prettyJsonEncode(options.headers)}');
    logDebug(
        'onRequest ${options.method} Request data => ${_prettyJsonEncode(options.data)}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logDebug(
        'onResponse: StatusCode: ${response.statusCode}, data: ${_prettyJsonEncode(response.data)}',
        level: (response.statusCode == HttpStatus.ok ||
                response.statusCode == HttpStatus.accepted ||
                response.statusCode == HttpStatus.created)
            ? Level.success
            : Level.error);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';

    logDebug('onError: ${options.method} request => $requestPath',
        level: Level.error);
    logDebug('onError: ${err.error}, message: ${err.message}',
        level: Level.error);
    super.onError(err, handler);
  }

  String _prettyJsonEncode(dynamic data) {
    try {
      const encoder = JsonEncoder.withIndent('  ');
      final jsonString = encoder.convert(data);
      return jsonString;
    } catch (e) {
      return data.toString();
    }
  }
}
