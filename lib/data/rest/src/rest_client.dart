import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rick_and_morty/data/rest/src/dio_client.dart';
import 'package:rick_and_morty/models/models.dart';

class RestClient extends DioClient {
  Future<AllCharacters> getAllCharacters({required int page}) async {
    // var limit = 30;
    log("getAllCharacters Запрос получения всех персонажей");
    String path = "/character";
    try {
      final response = await get<AllCharacters>(
        path,
        queryParameters: {"pages": page},
      );
      log("getAllCharacters Запрос персонажей завершен успешно");
      return response;
    } on DioException catch (e) {
      log("getAllCharacters Запрос персонажей завершен с ошибкой\n$e");
      rethrow;
    }
  }
}
