import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../core/utils/devlog.dart';

class LoggingInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    log(
      "-----------------[ REQUEST ]------------------------\n"
      "[ API PATH    ] : ${options.path} \n"
      "[ API METHOD  ] : ${options.method} \n"
      "[ REQ DATA    ] : ${options.data} \n"
      "[ REQ HEADERS ] : ${options.headers} \n"
      "-----------------------------------------------------------------------------\n",
      name: " API REQUEST ",
    );
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(Response response, ResponseInterceptorHandler handler) async {
    log(
      "-----------------[ RESPONSE ]------------------------\n"
      "[ RES PATH     ] : ${response.requestOptions.path} \n"
      "[ RES STATUS   ] : ${response.statusCode} \n"
      "[ RES DATA     ] : ${response.data} \n"
      "-----------------------------------------------------------------------------\n",
      name: " API RESPONSE ",
    );

    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    devlogError("RESPONSE_ERROR : $err");
    devlogError("ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}");
    return super.onError(err, handler);
  }
}
