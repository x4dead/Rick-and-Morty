import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:rick_and_morty/utils/constants/url_constants.dart';
// import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
// import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
// import 'package:flutter/services.dart';
// import 'package:sfera_web/utils/utils.dart';

import 'custom_compute.dart';
import 'custom_interceptor.dart';

class DioClient<T extends Object, K> {
  late Dio _dio;

  DioClient() {
    // final dbcache = HiveCacheStore(null);
    // final cacheOptions = CacheOptions(
    //   store: dbcache,
    //   hitCacheOnErrorExcept: [401, 403],
    //   maxStale: const Duration(days: 7),
    // );
    const timer = Duration(seconds: 20);
    // const fileTimer = Duration(minutes: 2);
    _dio = Dio()
      ..options.baseUrl = UrlConstants.instanse.restUrl
      ..options.connectTimeout = timer
      // ..options.receiveTimeout = fileTimer
      // ..options.sendTimeout = fileTimer
      ..interceptors.add(const CustomInterceptor());
    // ..interceptors.add(DioCacheInterceptor(options: cacheOptions));
  }
  Dio get dio => _dio;
  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    // if (!path.contains('/profile/api/checkAccountToken') &&
    //     !path.contains('/read-all-messages/') &&
    //     T != Uint8List &&
    //     T != String) {
    final response =
        await _dio.get<String>(path, queryParameters: queryParameters);
    return await CustomCompute<T>().getCompute(response);
    // } else if (T == Uint8List) {
    //   final response = await _dio.get(path, queryParameters: queryParameters);
    //   return Uint8List.fromList(response.data) as T;
    // } else {
    // dynamic response;
    // try {
    //   response = await _dio.get(path, queryParameters: queryParameters);
    //   if (response.data != null) {
    //     return response.data;
    //   } else {
    //     return '' as T;
    //   }
    // } catch (e) {
    //   print(e);
    // }
    // return response.data;
    // }
  }

  // Future<T> post<T>(String path,
  //     {Object? data,
  //     Map<String, dynamic>? queryParameters,
  //     Options? options}) async {
  //   if (path.contains('/auth/api/login')) {
  //     return await _dio.post(path, data: data, queryParameters: queryParameters)
  //         as T;
  //   } else {
  //     final response = await _dio.post<String>(
  //       path,
  //       data: data,
  //       options: options,
  //       queryParameters: queryParameters,
  //     );
  //     if (T == String) {
  //       return response.data! as T;
  //     }
  //     return await CustomCompute<T>().getCompute(response);
  //   }
  // }

  Future<Response> put(String path,
          {Object? data, Map<String, dynamic>? queryParameters}) async =>
      _dio.put<T>(path, data: data, queryParameters: queryParameters);

  // Future<T> putData<T>(String path,
  //     {Object? data, Map<String, dynamic>? queryParameters}) async {
  //   final response = await _dio.put<String>(path,
  //       data: data, queryParameters: queryParameters);
  //   return await CustomCompute<T>().getCompute(response);
  // }

  // Future<Response> patch(String path, {Map<String, dynamic>? data}) async =>
  //     _dio.patch<T>(path, data: data);

  // Future<Response> delete(String path,
  //         {Map<String, dynamic>? data,
  //         Map<String, dynamic>? queryParameters}) async =>
  //     _dio.delete<T>(path, data: data, queryParameters: queryParameters);

  // Future<Response> download(
  //   bool isFile,
  //   String path,
  //   String fileName, {
  //   Map<String, dynamic>? data,
  //   void Function(int, int)? onReceiveProgress,
  // }) async {
  //   late Directory? dir;
  //   // final regExp = RegExp(r'\.(m4a|mp3|mp4|mov|ogg)$', caseSensitive: false);
  //   // final isValid = regExp.hasMatch(fileName);
  //   if (isFile) {
  //     dir = await getDownloadsDirectory();
  //     // final bool isThere = await cacheDir.exists();
  //     // if (!isThere) {
  //     //   dir = await Directory(AppDataConstants.cacheDirectoryPath)
  //     //       .create(recursive: true);
  //     // } else {
  //     //   dir = cacheDir;
  //     // }
  //   } else {
  //     dir = await AppDataConstants.cacheDirectory;
  //   }
  //   return _dio.download(path, '${dir!.path}/$fileName',
  //       data: data,
  //       onReceiveProgress: onReceiveProgress,
  //       options: Options(receiveTimeout: const Duration(minutes: 15)));
  // }

  Future linkFetch(String path) {
    final dio = Dio();
    return dio.get(path);
  }

  // Future<String> sendBird() async {
  //   const apiId = 'MzEzQ0I0RDctQTNEOC00MzRELTk5NTgtMzU2MDM0NDk4MzJD';
  //   const SEND_BIRD_ACCESS_TOKEN = "0674d89a13c9d0d132d0651cab984ecf7f6c2702";
  //   const SEND_BIRD_APP_ID = "E6951BA4-992B-4E01-9550-9D423B1F2717";
  //   final decodeApiId = utf8.decode(base64.decode(apiId));
  //   final String url =
  //       'https://api-$SEND_BIRD_APP_ID.sendbird.com/v3/users/${UserPref.getUserId}';
  //   final token = utf8.decode(base64.decode(UrlConstants().sendbirdApiToken));
  //   try {
  //     final response = await _dio.get(
  //       url,
  //       options: Options(headers: {'Api-token': SEND_BIRD_ACCESS_TOKEN}),
  //     );
  //     if (response.statusCode == 200) {
  //       final String sendBirdtoken = response.data['access_token'] as String;
  //       return sendBirdtoken;
  //     }
  //     return '';
  //   } catch (e) {
  //     //GET TOKEN ON REGISTER USER
  //     //TODO:
  //     // if (await registerUserInSendbird()) {
  //     //   try {
  //     //     final resp = await _dio.get(
  //     //       url,
  //     //       options: Options(headers: {'Api-token': token}),
  //     //     );
  //     //     if (resp.statusCode == 200) {
  //     //       final String newSendBirdtoken = resp.data['access_token'] as String;
  //     //       return newSendBirdtoken;
  //     //     }
  //     //   } catch (e) {
  //     //     _logger.e('GET CALL TOKEN ERROR: $e');
  //     //     return '';
  //     //   }
  //     // }
  //     // _logger.e('GET CALL TOKEN ERROR: $e');
  //   }
  //   return '';
  // }
}
