import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rick_and_morty/utils/exceptions/custom_dio_exception.dart';
// import 'package:sfera_web/utils/utils.dart';

class CustomInterceptor extends Interceptor {
  const CustomInterceptor();

  static const appJson = 'application/json';
  static const multipart = 'multipart/form-data';
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode! ~/ 100 == 2) {
      return handler.next(response);
    } else {
      return handler.reject(DioException(
          requestOptions: RequestOptions(),
          response: response,
          error: 'Произошла ошибка при выполнении запроса',
          type: DioExceptionType.badResponse));
    }
  }

  // @override
  // void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  //   final headersToken = {"Authorization": UserPref.getToken};
  //   final path = options.path.toLowerCase();
  //   if (!path.contains('/auth/api/login')) {
  //     if (path.contains('/feed-v2/')) {
  //       options.headers = {
  //         "Authorization": 'Bearer ${UserPref.getToken}',
  //       };
  //     } else if (path.contains('/profile/api/profile/getUserShortProfiles')) {
  //       options.headers = {"Token": UserPref.getToken};
  //       options.contentType = appJson;
  //     } else if (path.contains('/job-lite/api/v1/vacancy-message/')) {
  //       final String lang =
  //           ContextLocalization(navigatorKey.currentState!.overlay!.context)
  //               .localization
  //               .localeName;
  //       options.headers = {
  //         "Accept-Language": lang,
  //         "Authorization": UserPref.getToken
  //       };
  //       options.contentType = appJson;
  //     } else if (path.contains('png') ||
  //         path.contains('jpg') ||
  //         path.contains('jpeg') ||
  //         path.contains('webp')) {
  //       options.headers = headersToken;
  //       options.responseType = ResponseType.bytes;
  //     } else {
  //       options.headers = headersToken;
  //       if (path.contains('/asap/api/v1/asap/chat/load') &&
  //               !path.contains('/asap/api/v1/asap/chat/load_link/') ||
  //           path.contains('/asap/api/v1/asap/chat/load_avatar/')) {
  //         options.contentType = multipart;
  //       } else {
  //         options.contentType = appJson;
  //       }
  //     }
  //   }
  //   return handler.next(options);
  // }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final error = handleError('Произошла ошибка при выполнении запроса', err);
    final dioError =
        CustomDioException(requestOptions: err.requestOptions, message: error);
    return handler.reject(dioError);
  }

  String handleError(String message, dynamic error) {
    log("REST ERROR: $error");
    if (error is DioException) {
      String errorMessage = message;
      if (error.response != null) {
        //TODO: Нормальный показ ошибок HandlerError 2.0
        final statusCode = error.response!.statusCode;
        final code = 'Code $statusCode:';
        final data = error.response?.data;
        final String? mes = data['message'] ?? data['error_description'];
        switch (statusCode) {
          case 400:
            errorMessage = mes ?? '$code Некорректный запрос';
            break;
          case 401:
            errorMessage = mes ?? '';
            break;
          case 403:
            errorMessage = mes ?? '$code Доступ запрещен';
            break;
          case 404:
            errorMessage = mes ?? '$code Запрашиваемый ресурс не найден';
            break;
          case 500:
            errorMessage = mes ?? '$code Внутренняя ошибка сервера';
            break;
          default:
            errorMessage =
                mes ?? '$code Произошла ошибка при выполнении запроса';
            break;
        }
      } else if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.receiveTimeout) {
        errorMessage = 'Превышено время ожидания';
      } else if (error.type == DioExceptionType.cancel) {
        errorMessage = 'Запрос был отменен';
      }
      return errorMessage;
    }
    return message;
  }
}
