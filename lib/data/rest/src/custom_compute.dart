import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rick_and_morty/models/models.dart';

class CustomCompute<T> {
  FutureOr<T> getCompute(Response<String> resp) async =>
      await compute(_parse, resp);

  T _parse(Response<String> resp) {
    final jsonData = jsonDecode(resp.data!);
    if (jsonData is List) {
      return _parseItemList(jsonData);
    } else {
      return _parseItem(jsonData);
    }
  }

  T _parseItemList(Iterable<dynamic> jsonData) {
    // if (T == List<ChronicleMeta>) {
    //   return List.from(jsonData).map((e) => ChronicleMeta.fromMap(e)).toList()
    //       as T;
    // } else {
    throw 'Error Parsing';
    // }
  }

  T _parseItem(Map<String, dynamic> jsonData) {
    if (T == AllCharacters) {
      return AllCharacters.fromMap(jsonData) as T;
    } else if (T == Character) {
      return Character.fromMap(jsonData) as T;
    } else if (T == RestAllEpisodes) {
      return RestAllEpisodes.fromMap(jsonData) as T;
    } else if (T == RestSingleEpisode) {
      return RestSingleEpisode.fromMap(jsonData) as T;
    } else if (T == RestAllLocation) {
      return RestAllLocation.fromMap(jsonData) as T;
    } else if (T == RestSingleLocation) {
      return RestSingleLocation.fromMap(jsonData) as T;
    } else {
      throw 'Error Parsing';
    }
  }
}
