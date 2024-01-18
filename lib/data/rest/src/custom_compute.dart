import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../models/models.dart';
// import 'package:sfera_web/data/db/database.dart' as db;
// import 'package:sfera_web/model/models.dart';
//TODO: CUSTOM COMPUTE PROFILE
class CustomCompute<T> {
  FutureOr<T> getCompute(Response<String> resp) async =>
      await compute(_parse, resp);

  T _parse(Response<String> resp) {
    final jsonData = jsonDecode(resp. data!);
    if (jsonData is List) {
      return _parseItemList(jsonData);
    } else {
      return _parseItem(jsonData);
    }
  }

  T _parseItemList(Iterable<dynamic> jsonData) {
    // try {
    // if (T == List<Contact>) {
    //   final first = jsonData.first;
    //   if (first == null) {
    //     return [] as T;
    //   }
    //   if (first['peer_profile_id'] == null) {
    //     return List.from(jsonData)
    //         .map((item) => Contact.fromRestShortUser(item))
    //         .toList() as T;
    //   } else {
    //     return List.from(jsonData)
    //         .map((item) => Contact.fromContactRest(item))
    //         .toList() as T;
    //   }
    // } else if (T == List<ProfilePhotos>) {
    //   return List.from(jsonData).map((e) => ProfilePhotos.fromMap(e)).toList()
    //       as T;
    // } else if (T == List<FeedData>) {
    //   return List.from(jsonData).map((e) => FeedData.fromMap(e)).toList() as T;
    // } else if (T == List<NotWorkingProfile>) {
    //   return List.from(jsonData)
    //       .map((e) => NotWorkingProfile.fromMap(e))
    //       .toList() as T;
    // } else if (T == List<MomentMeta>) {
    //   return List.from(jsonData).map((e) => MomentMeta.fromMap(e)).toList()
    //       as T;
    // } else if (T == List<LanguageResponse>) {
    //   return List.from(jsonData)
    //       .map((e) => LanguageResponse.fromMap(e))
    //       .toList() as T;
    // } else if (T == List<ChronicleMeta>) {
    //   return List.from(jsonData).map((e) => ChronicleMeta.fromMap(e)).toList()
    //       as T;
    // } else if (T == List<LinkRest>) {
    //   return List.from(jsonData).map((item) => LinkRest.fromMap(item)).toList()
    //       as T;
    // } else if (T == List<db.UserShortProfile>) {
    //   return List.from(jsonData).map((item) {
    //     item['languages'] = item['languages'].toString();
    //     return db.UserShortProfile.fromJson(item);
    //   }).toList() as T;
    // } else {
    //   // } catch (e) {
      throw 'Error Parsing';
    // }
    // }
  }

  T _parseItem(Map<String, dynamic> jsonData) {
    // if (T == sec.SectionRest) {
    //   return sec.SectionRest.fromMap(jsonData) as T;
    // } else
    if (T == RestAllCharacters) {
      return RestAllCharacters.fromMap(jsonData) as T;
    } else if (T == RestSingleCharacter) {
      return RestSingleCharacter.fromMap(jsonData) as T;
    } else if (T == RestAllEpisodes) {
      return RestAllEpisodes.fromMap(jsonData) as T;
    } else if (T == RestSingleEpisode) {
      return RestSingleEpisode.fromMap(jsonData) as T;
    } else if (T == RestAllLocation) {
      return RestAllLocation.fromMap(jsonData) as T;
    } else if (T == RestSingleLocation) {
      return RestSingleLocation.fromMap(jsonData) as T;
    } 
     else {
      throw 'Error Parsing';
    }
  }
}

// class SyncCompute {
//   Future<AsapSectionDto> syncCompute(sec.SectionResult res) async {
//     return compute(syncSection, res);
//   }

//   Future<AsapSectionDto> syncSection(sec.SectionResult res) async {
//     final mySections = await AsapSectionsServices().getAllSortSections();

//     final sectionForBase = AsapSectionDto.fromSection(res);

//     //Если у нас нет такой секции добавляем
//     if (mySections
//         .where((element) => element.id == sectionForBase.id)
//         .isEmpty) {
//       Logger().d('No Contains');
//       return sectionForBase;
//       // await AsapSectionsServices().createSection(section: sectionForBase);
//     }
//     return sectionForBase;
//   }
// }

// class SectionCompute {
//   Future getCompute(Response<String> resp) async =>
//       compute(_parseSection, resp);

//   _parseSection(Response<String> resp) {
//     // var d =  data;
//     final jsonData = jsonDecode(resp.data!);

//     return sec.SectionRest.fromMap(jsonData);
//   }
// }

extension DialogExt<T> on Object {
  Future<T> catchError(Function onError, {bool Function(Object error)? test}) {
    return Future<T>.error(onError);
  }

  Future<T> onErrorExtesion<E extends Object>(
    BuildContext context,
    FutureOr<T> Function(E error) handleError,
    Widget Function(BuildContext) builder,
  ) {
    return showDialogExtension(context, builder);
  }

  Future<T> showDialogExtension(
    BuildContext context,
    Widget Function(BuildContext) builder,
  ) async {
    return await showDialog(context: context, builder: builder);
  }
}
