import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:rick_and_morty/utils/constants/url_constants.dart';
import 'custom_compute.dart';
import 'custom_interceptor.dart';

enum RequestType {
  get,
  post,
  put,
  delete,
}

class RequestParams {
  final String url;
  final Map<String, dynamic>? queryParameters;
  final RootIsolateToken? token;
  final RequestType requiestType;
  final Object? data;
  final Options? options;

  RequestParams(
      {this.token,
      this.data,
      this.options,
      required this.url,
      required this.requiestType,
      required this.queryParameters});
}

class DioClient<T extends Object, K> {
  late Dio _dio;
  DioClient() {
    const timer = Duration(seconds: 30);
    _dio = Dio()
      ..options.baseUrl = UrlConstants.instanse.restUrl
      ..options.connectTimeout = timer
      ..interceptors.add(const CustomInterceptor());
  }
  Future<Response<String>> _sendRequest(
    RequestParams params,
  ) async {
    BackgroundIsolateBinaryMessenger.ensureInitialized(params.token!);
    switch (params.requiestType) {
      case RequestType.get:
        return await _dio.get<String>(params.url,
            queryParameters: params.queryParameters);
      case RequestType.post:
        return await _dio.post<String>(params.url,
            data: params.data,
            queryParameters: params.queryParameters,
            options: params.options);
      case RequestType.put:
        return await _dio.put<String>(params.url,
            data: params.data, queryParameters: params.queryParameters);
      case RequestType.delete:
        return await _dio.delete<String>(params.url,
            data: params.data, queryParameters: params.queryParameters);
    }
  }

  Dio get dio => _dio;
  Future<T> get<T>(String path,
      {Map<String, dynamic>? queryParameters, Options? options}) async {
    final token = RootIsolateToken.instance;
    final params = RequestParams(
      requiestType: RequestType.get,
      token: token,
      url: path,
      queryParameters: queryParameters,
    );

    final response = await compute(_sendRequest, params);

    return await CustomCompute<T>().getCompute(response);
  }

  Future<T> post<T>(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    final token = RootIsolateToken.instance;
    final params = RequestParams(
      requiestType: RequestType.post,
      token: token,
      url: path,
      queryParameters: queryParameters,
      data: data,
      options: options,
    );

    final response = await compute(_sendRequest, params);

    return await CustomCompute<T>().getCompute(response);
  }

  Future<Response> put(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    final token = RootIsolateToken.instance;
    final params = RequestParams(
      requiestType: RequestType.put,
      token: token,
      url: path,
      data: data,
      queryParameters: queryParameters,
    );

    final response = await compute(_sendRequest, params);

    return response;
  }

  Future<T> putData<T>(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    final token = RootIsolateToken.instance;
    final params = RequestParams(
      requiestType: RequestType.put,
      token: token,
      url: path,
      data: data,
      queryParameters: queryParameters,
    );

    final response = await compute(_sendRequest, params);

    return await CustomCompute<T>().getCompute(response);
  }

  Future<Response> patch(String path, {Map<String, dynamic>? data}) async =>
      _dio.patch<T>(path, data: data);

  Future<Response> delete(String path,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters}) async {
    final token = RootIsolateToken.instance;
    final params = RequestParams(
      requiestType: RequestType.delete,
      token: token,
      url: path,
      data: data,
      queryParameters: queryParameters,
    );

    final response = await compute(_sendRequest, params);

    return response;
  }
}
